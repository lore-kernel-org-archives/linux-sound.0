From: Peter Zijlstra <peterz@infradead.org>
Date: Mon, 01 Apr 2019 11:03:29 +0000
Subject: Re: [PATCH 0/4] Introduce the aural error reporting framework
Message-Id: <20190401110329.GA12232@hirez.programming.kicks-ass.net>
List-Id: <linux-sound.vger.kernel.org>
References: <20190401102456.11162-1-mcroce@redhat.com>
In-Reply-To: <20190401102456.11162-1-mcroce@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matteo Croce <mcroce@redhat.com>
Cc: x86@kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org, platform-driver-x86@vger.kernel.org

On Mon, Apr 01, 2019 at 12:24:51PM +0200, Matteo Croce wrote:
> The buzzer driver is simple, requires just a few register writes to work,
> the hardware is extremely cheap and is already present on most machines.

What, no morse-code register dumps?
