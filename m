From: Juhana Sadeharju <kouhia@nic.funet.fi>
Date: Sun, 24 Oct 1999 23:26:21 +0000
Subject: Re: streaming from disk to terminatorX added (via mmap)
Message-Id: <marc-linux-sound-94080770301655@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94077890409185@msgid-missing>
In-Reply-To: <marc-linux-sound-94077890409185@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

>From:   Benno Senoner <sbenno@gardena.net>
>
>- the 44byte WAV header isn't skipped

I suggest the full parse of WAV file because some editors put extra
chunks to end. Actually a full parse is not needed because we need
just to find the offset and length for mmapping, but don't just skip!

Yours,

Juhana
