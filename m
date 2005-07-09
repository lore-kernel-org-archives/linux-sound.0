From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Sat, 09 Jul 2005 00:07:35 +0000
Subject: Re: [PATCH 2/14] sound/ppc: fix-up sleeping paths
Message-Id: <20050709000735.GI2596@us.ibm.com>
List-Id: <linux-sound.vger.kernel.org>
References: <20050709000405.GE2596@us.ibm.com>
In-Reply-To: <20050709000405.GE2596@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 08.07.2005 [17:04:05 -0700], Nishanth Aravamudan wrote:
> From: Nishanth Aravamudan <nacc@us.ibm.com>

<snip>

> Description: Fix-up sleeping in sound/ppc. Replace big_mdelay() with
> msleep() to guarantee the task delays as expected. This also involved
> replacing/removing custom sleep functions.

Forgot to CC: Kernel-Janitors.

Thanks,
Nish
