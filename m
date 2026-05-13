Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610A6357CF7
	for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 15:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778686771; cv=none; b=sL5ZYkrs0/bMaetxkd3lc2pwOx8xq3KYgwSLzjk5qYGpnB8n6fuWVUggfKwaSeLvxZTZzuGItqbQdJB7cGWIjKs5097O37PYcxIXen+24YzvjAmo0z3MbkQn22giTsMx3BswCXQfn/SPQVGqVs82QBxVQwd+lgUYjhTpURQzv74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778686771; c=relaxed/simple;
	bh=NdlYDAM51qB+8F2hKvxMv51Ji9qt35Ia1AUD6zMn2Hk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P+TCqJ0EaDrvC9DAgbfGTsIwJPIFPuBCOd4XAccsdE9OodQW4Uvvm4l60Y8TAoSA3bnPCFEGmbJVAv7PF+BHDjRnUKV+IaPYqECvidf9ET1v4jJwbtIus1vl19lV4Hi6DfPE7PVNX+lWxyXkVv+5YH604BK1AJP/3SvP2hDaAHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mdSHPurM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mdSHPurM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4164BC19425;
	Wed, 13 May 2026 15:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778686771;
	bh=NdlYDAM51qB+8F2hKvxMv51Ji9qt35Ia1AUD6zMn2Hk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mdSHPurMLrIcmaZPKzU8C/DOQYhPRzdw0EwKT0Y35+eO5UISw4f4jQKvDOGk5SKFY
	 vCTNjXOtG3nggXhjLUs851ir6CtiAbl7mcb+6VPtu42l/OYJ9CIjkyV4bNWEmm8mBf
	 B3+ja49ErYkx7GPRv4H9Q8s5JQa/KNsIl2bjO+m7MBmE6uU2+CoqoXJbZ/Z7sBOr41
	 TAF9Pt0pzstWjXqEYa/NGhdfBWL0jReMhbwEw2RX2r5Twcrh0FPfVSgbvQbb9c3GGw
	 X0hDwX4ts6uVI0rIayXb5/SQqHn6XrbCTmf954WCHThFshvXPRjgyJDPYsDIh+yMMl
	 fAY3GlRp0Lorw==
Date: Wed, 13 May 2026 21:09:27 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: broonie@kernel.org, tiwai@suse.com, linux-sound@vger.kernel.org,
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
	ckeepax@opensource.cirrus.com
Subject: Re: [PATCH v14 6/6] soundwire: intel_auxdevice: Add es9356 to
 wake_capable_list
Message-ID: <agSbL_gdW6og_PXe@vaman>
References: <20260513031554.5422-1-zhangyi@everest-semi.com>
 <20260513031554.5422-7-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513031554.5422-7-zhangyi@everest-semi.com>

On 13-05-26, 11:15, Zhang Yi wrote:
> Add es9356 to the wake_capable_list
> because it can generate jack events whilst the bus is stopped

Does this need to go thru ASoC tree, I can pick it up..

> 
> Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
> ---
>  drivers/soundwire/intel_auxdevice.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
> index ee951be15..0b8107bec 100644
> --- a/drivers/soundwire/intel_auxdevice.c
> +++ b/drivers/soundwire/intel_auxdevice.c
> @@ -72,6 +72,7 @@ static struct wake_capable_part wake_capable_list[] = {
>  	{0x025d, 0x717},
>  	{0x025d, 0x721},
>  	{0x025d, 0x722},
> +	{0x04b3, 0x9356},
>  };
>  
>  static bool is_wake_capable(struct sdw_slave *slave)
> -- 
> 2.17.1

-- 
~Vinod
