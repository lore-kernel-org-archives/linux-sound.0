From: Christoph Hellwig <chhellwig@gmx.net>
Date: Sat, 25 Mar 2000 09:16:03 +0000
Subject: Re: Clicking Crystal
Message-Id: <marc-linux-sound-95397642412780@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95389484719205@msgid-missing>
In-Reply-To: <marc-linux-sound-95389484719205@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Fri, Mar 24, 2000 at 07:48:04AM -0800, Miles Lane wrote:
> Christoph,
> 
> I have had this problem with my cs4232 forever.
> Is this something you plan on addressing in your
> current wave of sound driver cleanup?

No. The cs4232 driver is only a wrapper around the ad1848/mss driver.
I did not change anything on the behavior off this driver. I have neither
a cs423x nor an ad1848 to verify this.

Christoph

-- 
Always remember that you are unique.  Just like everyone else.
