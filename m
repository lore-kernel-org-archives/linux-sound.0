From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Sun, 08 Aug 1999 23:53:14 +0000
Subject: Re: File descriptors and Sound
Message-Id: <marc-linux-sound-93415633109349@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93415570309034@msgid-missing>
In-Reply-To: <marc-linux-sound-93415570309034@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

> If the device is full-duplex how can I have one application
> reading it and another writing?

You either do file handle passing (funky) or normally one program runs the
other: ie

	open file
	fork()
	
	child:
		exec other app (which inherits file)
		exit

	parent:
		run code
