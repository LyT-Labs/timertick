import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(): string {
    return 'Hello TimerTick API ! \n Que bueno que está esto \n si la verdad god \n Sep =)';
    // return 'Hello TimerTick API !!!!!!! <3';
  }
}
