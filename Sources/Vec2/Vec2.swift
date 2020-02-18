import Glibc

public struct Vec2: AdditiveArithmetic, Differentiable {
  public var x: Float
  public var y: Float

  @differentiable
  public init(_ x: Float, _ y: Float) {
    self.x = x
    self.y = y
  }

  @differentiable
  public init(magnitude: Float, direction: Float) {
    self.x = magnitude * cos(direction)
    self.y = magnitude * sin(direction)
  }
}

public extension Vec2 {
  @differentiable
  static func + (_ lhs: Vec2, _ rhs: Vec2) -> Vec2 {
    Vec2(lhs.x + rhs.x, lhs.y + rhs.y)
  }

  @differentiable
  static func - (_ lhs: Vec2, _ rhs: Vec2) -> Vec2 {
    Vec2(lhs.x - rhs.x, lhs.y - rhs.y)
  }

  @differentiable
  static func * (_ lhs: Float, _ rhs: Vec2) -> Vec2 {
    Vec2(lhs * rhs.x, lhs * rhs.y)
  }

  @differentiable
  static func / (_ lhs: Vec2, _ rhs: Float) -> Vec2 {
    Vec2(lhs.x / rhs, lhs.y / rhs)
  }

  @differentiable
  var magnitudeSquared: Float {
    x * x + y * y
  }

  @differentiable
  var magnitude: Float {
    sqrt(magnitudeSquared)
  }

  @differentiable
  var direction: Float {
    atan2(y, x)
  }

  @derivative(of: direction)
  func vjpDirection() -> (value: Float, pullback: (Float) -> Vec2) {
    func pullback(_ v: Float) -> Vec2 {
      let d = x * x + y * y
      return v * Vec2(-y / d, x / d)
    }
    return (direction, pullback)
  }

  @differentiable
  func dot(_ other: Vec2) -> Float {
    x * other.x + y * other.y
  }
}
