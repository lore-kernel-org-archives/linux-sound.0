From: Eric Mitchell <emitchell@altaira.com>
Date: Wed, 12 May 1999 17:16:49 +0000
Subject: Re: Playing a sine wave
Message-Id: <marc-linux-sound-92656742123983@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92649832906805@msgid-missing>
In-Reply-To: <marc-linux-sound-92649832906805@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hannu Savolainen wrote:
> 
> On Wed, 12 May 1999, Hrafnkell Eiriksson wrote:
> 
> > Hi
> >
> > Is it possible to use the sequencer stuff in the OSS sound driver
> > to let the sound card play a sine wave of a given frequency?
> In theory it's possible to play sine waves using the OPL3 FM synth chip
> available on most older (ISA) soundcards. However this is very inpractical
> way.
> 
> A much easier way is using /dev/dsp. You only need to construct few cycles
> of sine wave at given frequency to a buffer. Then just keep writing this
> buffer to /dev/dsp as many times as you need. In fact it may even be
> possible that somebody has already written this kind of app (look at
> ftp://sunsite.unc.edu/pub/Linux/apps/sound).

The source for esound (http://www.tux.org/~ricdude/EsounD.html)
includes the code necessary to do this in the file, esd.c.  I have
reproduced it below for your convenience:

Feel free to ask if you have any questions on the code.

buf is the buffer to store the audio data in,
format determines whether to use 8bit unsigned or 16bit signed data,
magl is the magnitude for the left side,
magr is the magnitude for the right side,
freq is the desired frequency in Hertz,
speed is the playback rate of the audio device,
length is the number of samples to be stored in buf,
offset is used to get a perfect sine waves, buffer after buffer,
    by setting offset to the product of the number of buffers already 
    played and the length of the buffer in samples.


void set_audio_buffer( void *buf, esd_format_t format,
		       int magl, int magr, 
		       int freq, int speed, int length, long offset )
{
    int i;
    float sample;
    float kf = 2.0 * 3.14 * (float)freq / (float)speed;

    unsigned char *uc_buf = (unsigned char *)buf;
    signed short *ss_buf = (signed short *)buf;
    
    /* printf( "fmt=%d, ml=%d, mr=%d, freq=%d, speed=%d, len=%ld\n",
       format, magl, magr, freq, speed, length ); */

    switch ( format & ESD_MASK_BITS )
    {
    case ESD_BITS8:
	for ( i = 0 ; i < length ; i+=2 ) {
	    sample = sin( (float)(i+offset) * kf );
	    uc_buf[i] = 127 + magl * sample;
	    uc_buf[i+1] = 127 + magr * sample;
	}
	break;
    case ESD_BITS16:	/* assume same endian */
	for ( i = 0 ; i < length ; i+=2 ) {
	    sample = sin( (float)(i+offset) * kf );
	    ss_buf[i] = magl * sample;
	    ss_buf[i+1] = magr * sample;
	}
	break;
    default:
	fprintf( stderr, 
		 "unsupported format for set_audio_buffer: 0x%08x\n", 
		 format );
	exit( 1 );
    }


    return;
}


> Best regards,
> 
> Hannu
> -----
> Hannu Savolainen (hannu@opensound.com)
> http://www.opensound.com (Open Sound System (OSS))
> http://www.compusonic.fi (Finnish OSS pages)

-- 
+=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=+
| Eric B. Mitchell         mailto:emitchell@altaira.com |
| tel: (301) 809 - 3534    Altair Aerospace Corporation |
| tel: (800) 7 - ALTAIR    4201 Northview Dr. Suite 410 |
| fax: (301) 805 - 8122    Bowie, MD  20716             |
+=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=+
              ,___
          /"\  / o=\  /"""---==/
         /   \_/  \__/   ---==/ 
         |    //\   || /""TT""/ //\   || ||""\
         |   //  \  ||    ||   //  \  || ||__/
         |  //--=\ |L--/ ||  //--=\ || || "=,
          \      ---==/
           \____---==/
