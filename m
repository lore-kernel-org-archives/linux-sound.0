From: Kai Vehmanen <kaiv@wakkanet.fi>
Date: Fri, 28 May 1999 20:25:41 +0000
Subject: Re: recording overrun
Message-Id: <marc-linux-sound-92810251310919@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Tue, 25 May 1999, georg.funke@netcologne.de wrote:

> does anybody know what recording overrun is and why i get these
> messages?

A common problem when doing digital recording... Here's some info
from OSS programming guide...:

--cut--
   A playback underrun situation occurs when the application fails to
   write more data before the device gets earlier data completely played.
   This kind of underrun occurs if:
     * The application needs too much time for processing the data. For
       example the program is being run on a too slow CPU or there are
       many other applications using the processor. Also loading audio
       data from a floppy disk is likely to fail. It is usually very
       difficult and often impossible to find a solution to this kind of
       underrun problem. Possibly only writing some parts of the program
       in assembler could help.
     * There is slight variations in amount of CPU time the application
       gets. In this way application which normally works fast enough may
       randomly run out of time.
     * The application attempts to work too much in real time. Having
       less data in the output buffer decreases delays in games and other
       real time applications. However the application must take care
       that it always writes new data before earlier written samples get
       completely played.
   Effect of underrun depends on the audio device. However in almost
   every case an audible defect is caused in the playback signal. This
   may be just a short pause, a click or a repeated section of signal.
   Repeated underruns may cause very strange effects. For example 100
   underruns per second causes sometimes a signal having frequency of 100
   Hz (it could be very difficult to find the reason which causes this
   effect).
[...]
   A recording overrun situation occurs if the device fills the recording
   buffer completely. If this happens, the device is stopped and further
   samples being recorded will be discarded. Reasons of recording
   overruns are very similar than causes of playback underruns. A very
   common situation where playback overrun may occur is recording of high
   speed audio directly to disk. In Linux this doesn't work except with
   very fast disk (in other environments this should not be a problem).
--cut--

-- 
Kai Vehmanen ----------------------------- CS, University of Turku, Finland
 : email                       mailto:kaiv@wakkanet.fi
 : projects, home page, etc    http://www.wakkanet.fi/~kaiv/
 : ambient-idm-rock-... mp3/ra http://www.wakkanet.fi/~kaiv/sculpscape.html
