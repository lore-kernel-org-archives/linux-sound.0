From: Andy Lo A Foe <andy@alsa-project.org>
Date: Wed, 27 Oct 1999 14:02:22 +0000
Subject: Re: mp3 seeking
Message-Id: <marc-linux-sound-94103418715603@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94096104300746@msgid-missing>
In-Reply-To: <marc-linux-sound-94096104300746@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Tue, 26 Oct 1999 est@hyperreal.org wrote:

> First, I must thank you for alsaplayer since I'm using an adaptation
> of your adaptation of the mpg123 code in the next major release of
> oolaboola.  I'm encapsulating it in a separate process (called
> mp3serv) to get re-entrancy.  I may move to the xing decoder but the
> process interface will remain the same.

Very interesting. I'm thinking about a similar solution for doing
reentrancy with plugins that don't support it, something like a proxy
plugin interface with IPC and shared memory. Where can I get the latest
version of oolaboola?

> My understanding was that it *may* take more than 3 frames of priming
> to resynchronize.  One of the xing/freemap people got me the logic but
> I haven't implemented it yet.

I'm using 3 right now. You need a bit more for lower bitrates it seems.
I've never really looked into the encoding algorithm so... :)

> Another issue is how to find a given frame in the first place.  Given
> that each frame may have an extra byte of padding, a multiplication is
> (audibly!) unreliable.  I've implemented a table-of-contents mechanism
> to deal with this.

Yes, if you want 100% correct seeking the best thing you can do is to
store the frame start positions while decoding. It is a bit slow though.
Is that what you're doing? (for VBR encoded files I don't see any other
(simple) method to support seeking BTW)...

Regs,

Andy
--
AlsaPlayer, http://www.alsa-project.org/~andy/
