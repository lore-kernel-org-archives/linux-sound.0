Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com [185.226.149.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE8D332EC7;
	Tue, 25 Nov 2025 18:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.226.149.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764096942; cv=none; b=D2MYi4itOXwGNfLnJEsEe8nh3n7REz835pV18nnUuhFer0bNd7R4lZ/OTdw0NL1JthqmKwit5X1tmVXDqLGOw9SSPAbMuzqglEKP0TTO+CfOxUK+xDumumslcSQeCl/6l9xA9bqL3wEZTNRSUAx/3PK74iBMHzYk3nHRx5Kx/XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764096942; c=relaxed/simple;
	bh=xZaRqFknkCqa3VUjLF4F9jqPvXTG2/r1IX2VIiTjMCY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N20v5Rm+xFH7Y//SZj2u49u9jd+ldOOE8a6VzLkruBqKlfPJbxPHdfN+tD0knaCbDMeluBDRRSavgwW7qstXilMM1+xiraMWpEW1MefiDPQ3hMRv1aY39z/epqp8rgzWR6Rx96PdGdWmemKgIICfJs8sMyCcQcw8cFvRN9y7r8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=runbox.com; spf=pass smtp.mailfrom=runbox.com; dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b=ujO/q9BP; arc=none smtp.client-ip=185.226.149.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=runbox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runbox.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b="ujO/q9BP"
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight@runbox.com>)
	id 1vNyCN-0077do-Oe; Tue, 25 Nov 2025 19:55:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector1; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date;
	bh=S8iRI9MitoToC8ncyeQvevjNXJ47IZ3d1YdhhU06S0c=; b=ujO/q9BPJNvNzOUrO6kh/AXZyd
	ak6lePhVFVgesMfsI7lUrsD2INBvkQoN/ppG7+GMKLmojnacT36TbvpNLn8GARtsJZAQQA+uESVJ9
	TcudyzxpYPWVwoyu1LVyVMJgyD7WliZ+to5GaAC6yNCy5bL3PKYdljDbmuxn4xcPPY/2+iZZKGZRV
	On17qE41JleBsqKbe/s/qp8X5NYGH/xIfOL8zLinzqohaHdm5jYPO+MIRIe4G0ujXLBuKmShdOP5z
	8G/YZBCCWXmaeii/2hYT5kyaj6hzBfVTbJSTdlUaTigih1sT0cPbb1wG+pHu82/P62QJ2XeJdkrPq
	cZGTRfpw==;
Received: from [10.9.9.72] (helo=submission01.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight@runbox.com>)
	id 1vNyCN-0007S3-BS; Tue, 25 Nov 2025 19:55:35 +0100
Received: by submission01.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1vNyCK-00BYsD-Tc; Tue, 25 Nov 2025 19:55:33 +0100
Date: Tue, 25 Nov 2025 18:55:30 +0000
From: david laight <david.laight@runbox.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: broonie@kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] firmware: cs_dsp: Store control length as 32-bit
Message-ID: <20251125185530.22d9dbb9@pumpkin>
In-Reply-To: <20251124171536.78962-1-rf@opensource.cirrus.com>
References: <20251124171536.78962-1-rf@opensource.cirrus.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 24 Nov 2025 17:15:35 +0000
Richard Fitzgerald <rf@opensource.cirrus.com> wrote:

> The architectures supported by this driver have a maximum of 32-bits
> of address, so we don't need more than 32-bits to store the length of
> control data. Change the length in struct cs_dsp_coeff_ctl to an
> unsigned int instead of a size_t. Also make a corresponding trivial
> change to wm_adsp.c to prevent a compiler warning.
> 
> Tested on x86_64 builds this saves at least 4 bytes per control
> (another 4 bytes might be saved if the compiler was inserting padding
> to align the size_t).
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
>  drivers/firmware/cirrus/cs_dsp.c       | 2 +-
>  include/linux/firmware/cirrus/cs_dsp.h | 2 +-
>  sound/soc/codecs/wm_adsp.c             | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
> index 9acdcd75928a..36a5aefa16e7 100644
> --- a/drivers/firmware/cirrus/cs_dsp.c
> +++ b/drivers/firmware/cirrus/cs_dsp.c
> @@ -477,7 +477,7 @@ static int cs_dsp_debugfs_read_controls_show(struct seq_file *s, void *ignored)
>  
>  	list_for_each_entry(ctl, &dsp->ctl_list, list) {
>  		cs_dsp_coeff_base_reg(ctl, &reg, 0);
> -		seq_printf(s, "%22.*s: %#8zx %s:%08x %#8x %s %#8x %#4x %c%c%c%c %s %s\n",
> +		seq_printf(s, "%22.*s: %#8x %s:%08x %#8x %s %#8x %#4x %c%c%c%c %s %s\n",
>  			   ctl->subname_len, ctl->subname, ctl->len,
>  			   cs_dsp_mem_region_name(ctl->alg_region.type),
>  			   ctl->offset, reg, ctl->fw_name, ctl->alg_region.alg, ctl->type,
> diff --git a/include/linux/firmware/cirrus/cs_dsp.h b/include/linux/firmware/cirrus/cs_dsp.h
> index 69959032f8f5..0ec1cdc5585d 100644
> --- a/include/linux/firmware/cirrus/cs_dsp.h
> +++ b/include/linux/firmware/cirrus/cs_dsp.h
> @@ -102,7 +102,7 @@ struct cs_dsp_coeff_ctl {
>  	const char *subname;
>  	unsigned int subname_len;
>  	unsigned int offset;
> -	size_t len;
> +	unsigned int len;
>  	unsigned int type;
>  	unsigned int flags;
>  	unsigned int set:1;
> diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
> index 172dcdd7dbca..17cec79245d4 100644
> --- a/sound/soc/codecs/wm_adsp.c
> +++ b/sound/soc/codecs/wm_adsp.c
> @@ -1561,7 +1561,7 @@ static int wm_adsp_buffer_parse_coeff(struct cs_dsp_coeff_ctl *cs_ctl)
>  
>  	for (i = 0; i < 5; ++i) {
>  		ret = cs_dsp_coeff_read_ctrl(cs_ctl, 0, &coeff_v1,
> -					     min(cs_ctl->len, sizeof(coeff_v1)));
> +					     min((size_t)cs_ctl->len, sizeof(coeff_v1)));

You don't (shouldn't) need that cast.
min() won't object because both arguments are unsigned types.
The compiler will then 'promote' cs_ctl->len for the compares, but might use
the 'as if' rule and do 32bit maths anyway.

Given that the called function starts:
int cs_dsp_coeff_read_ctrl(struct cs_dsp_coeff_ctl *ctl,
			   unsigned int off, void *buf, size_t len)
{
...
	if (len + off * sizeof(u32) > ctl->len)
		return -EINVAL;

Maybe you should be changing that 'len' to u32 as well?

	David

>  		if (ret < 0)
>  			return ret;
>  

