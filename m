Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F5F33374B
	for <linux-sound@vger.kernel.org>; Wed, 18 Feb 2026 16:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771433594; cv=none; b=DszY4JwDG24gJhCrLCpZaOy1flAksLrYFWly+46ryo/PxdfvT2vtCOUDOZAaSlGQcCnpdmRgdlAYZbyPhut4dkYsAcOR6C7jfkzdhooU6CjapapfY9tZm7kfqsQPFho3naXr514s53A59QgZHn468E0bnBVdxPvUKFPJ+A832SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771433594; c=relaxed/simple;
	bh=Sape+webxMh8rUjqh6Yfq/qP/OVsZVll2E1tBitG/c8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bL7SiUT/5cakFcOm6wxGRLKPS//RBPPcZJjf79z8rh7DD0xZ8Ku3yk3sIw2/13UFgHBO8qDUATTTtc5HeZ/VKnUzo/TTcj/MvUYZXSAlhjG4JqxRzivJfoFu9pUJEUX13TeUDZrFertNBhzYgGLi2gsSQR3K8ILOj0OFvqC7MGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WlH8ntC5; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WlH8ntC5"
Message-ID: <06e00cc3-5c4a-4116-aa2f-ea61ab3493d4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771433580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6D3DOJTbKJ2CGS++v6mnviXANdibZiIvSe44oFu7EbY=;
	b=WlH8ntC5hISWIyWZSJRCq1rYIkw5Izxsd5/oPGl84NnJEBdxQx3eybOJyThsLnbx9p7BPs
	rqO1aVdnY5Yg98NA6wd7Zd7pz1jgewVSjo45f/uA0N5+EEN5tOcZq0GrigyibQnIW/DM7W
	AyXiw2cIt05riS728xzqH8WJMPeV0Ko=
Date: Wed, 18 Feb 2026 17:52:51 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3] soundwire: bus: demote UNATTACHED slave warnings to
 dev_dbg
To: Cole Leavitt <cole@unwrap.rs>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260217233533.4716-1-cole@unwrap.rs>
 <20260218140042.21536-1-cole@unwrap.rs>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260218140042.21536-1-cole@unwrap.rs>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2/18/26 15:00, Cole Leavitt wrote:
> The dev_warn() messages in sdw_handle_slave_status() for UNATTACHED
> transitions were added in commit d1b328557058 ("soundwire: bus: add
> dev_warn() messages to track UNATTACHED devices") to debug attachment
> failures with dynamic debug enabled.
> 
> These warnings fire during normal operation -- for example when a codec
> driver triggers a system reset after firmware download, or during
> initial multi-device enumeration due to the PING frame race documented
> in cadence_master.c -- producing misleading noise on every boot.

That second sentence doesn't seem right.
The problem documented in cadence_master.c was that devices may report as ATTACHED at the same time, but the detector only sees one device.
As a result only one of the two devices would be assigned a non-zero device number.
But the second device does not lose sync and never becomes UNATTACHED.

> The original debugging use case is fully served by dev_dbg(), which
> remains visible when dynamic debug is enabled.  Demote both state
> check warnings to dev_dbg().
> 
> Fixes: d1b328557058 ("soundwire: bus: add dev_warn() messages to track UNATTACHED devices")
> Signed-off-by: Cole Leavitt <cole@unwrap.rs>
> ---
> Changes in v3:
>  - Add Fixes tag and version changelog
> 
> Changes in v2:
>  - Drop unattach_pending flag approach entirely per reviewer feedback
>    (Pierre-Louis, Richard, Charles)
>  - Simply demote dev_warn() to dev_dbg() unconditionally
>  - Single patch instead of 2-patch series
> 
>  drivers/soundwire/bus.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index fb68738dfb9b..45234cc07f35 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -1899,8 +1899,8 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
>  
>  		if (status[i] == SDW_SLAVE_UNATTACHED &&
>  		    slave->status != SDW_SLAVE_UNATTACHED) {
> -			dev_warn(&slave->dev, "Slave %d state check1: UNATTACHED, status was %d\n",
> -				 i, slave->status);
> +			dev_dbg(&slave->dev, "Slave %d state check1: UNATTACHED, status was %d\n",
> +				i, slave->status);
>  			sdw_modify_slave_status(slave, SDW_SLAVE_UNATTACHED);
>  
>  			/* Ensure driver knows that peripheral unattached */
> @@ -1951,8 +1951,8 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
>  			if (slave->status == SDW_SLAVE_UNATTACHED)
>  				break;
>  
> -			dev_warn(&slave->dev, "Slave %d state check2: UNATTACHED, status was %d\n",
> -				 i, slave->status);
> +			dev_dbg(&slave->dev, "Slave %d state check2: UNATTACHED, status was %d\n",
> +				i, slave->status);
>  
>  			sdw_modify_slave_status(slave, SDW_SLAVE_UNATTACHED);
>  			break;

