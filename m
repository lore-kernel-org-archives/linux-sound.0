From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Thu, 08 Jul 1999 11:46:38 +0000
Subject: [alsa-user] Re: Microsoft RIFF, WAVE audio data, 1 bit, mono 8000 Hz
Message-Id: <marc-linux-sound-93266129329508@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


> I have a (free) voice mail service that provides the messages in a wav
> file which file(1) specifies as:

Dial it up and send it a steady tone square wave at about 1KHz. 
If my guess to the format is right then you will get back something vaguely
like 
	FF,00,FF,00,FF,00,FF,00

THen you can figure the bitendianness they use. Basically its exactly what
it sounds like - single bit above/below threshold values.

So you'd do 

	while(len)
	{
		uchar i=*data++;
		int ct;
		for(ct=0;ct<8;ct++)
		{
			if(i&0x80)
				play8bit(0xFF);
			else
				play8bit(0x00);
			i<<=1;
		}
		len--;
	}

		
------
To unsubscribe from <alsa-user@alsa-project.org> mailing list send message
'unsubscribe' in the body of message to <alsa-user-request@alsa-project.org>.
