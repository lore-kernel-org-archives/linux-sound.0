From: Thomas Sailer <sailer@ife.ee.ethz.ch>
Date: Thu, 05 Aug 1999 13:06:21 +0000
Subject: Re: MPEG Support
Message-Id: <marc-linux-sound-93385829528821@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93371079221997@msgid-missing>
In-Reply-To: <marc-linux-sound-93371079221997@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

"Jonathan C. Masters" wrote:
> 
> I have to disagree with you here. I believe that MPEG audio decoding/encoding
> and MPEG video decoding/encoding optional devices such as /dev/mpad /dev/mpae
> /dev/mpvd /dev/mpve would be emensely useful. It would save so much rewritten
> code (libraries are never quite as good as they sound) and my programs would

Why should a library be worse than kernel code?

Furthermore, in the kernel, you can't use:
- MMX
- Floating point
- KNI or ISSE or 3dNOW.

So kernel code will be slower than usermode code.

> instantaneously become much more enhanced. Besides, since MPEG decoding/encoding
> cards are popular these days, you begin to see the speed required (so much so

Please name one that does MPEG _AUDIO_, I don't know one. (I know
about MPEG video cards...)

Tom
