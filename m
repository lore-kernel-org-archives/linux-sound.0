Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCF8C8CE;
	Fri, 13 Feb 2026 03:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770953154; cv=none; b=oTtHtIRmUvMRupGeWkcwGRkaUFzmxGUjHDhWmBsyCwhROPcvA74jtTKO4a4+5Dmb95YVROetsz0cGLDblyC9EWLGzOKB7EfRGnJpWMfYOhX1JlPLY/+l5qVkkUO/oXZA2mxZqzDPcdydOzdIB89fyEH6TNjbIcQbg79AeKmOL80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770953154; c=relaxed/simple;
	bh=ARngVYHYNEWZP6CWFE1xgTEyWaaJOsLQF2us6n3dZ18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uzr3CFSa/a5LAws7uII0YLfSsCB41iApDgaLWJg/g20iTuXfkVWVXngKDhvZ68FaLc12Gm14AfX1bHDWsrjjmsOi9qzB+YYB8IN1/DuEqsZix1BLUbaViswXCDj6sRLSt0ajkgz6p9UAFffoSDT0cJb2dUGD4+LS9BDUlF6esos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IEwtAMUv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IEwtAMUv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B1F0C19424;
	Fri, 13 Feb 2026 03:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770953154;
	bh=ARngVYHYNEWZP6CWFE1xgTEyWaaJOsLQF2us6n3dZ18=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IEwtAMUvXlVYnBxJXPId/ry65tZpbhzUbRKrGss2POX1Kq6mx6FqpAfCbj9EFnrVb
	 TsbDGHs/V4JMmSjvYO4zRL1jTMemjlp8OigC0kf38fmvSvrZloWGLKDNAKTFQpLyB4
	 acKoogSHemmEmnHVQGKsWujKAqUtZvXi5J7rfpCFNi8//AVOQmMjCgtD81AqAoYFPW
	 sJU+PGTrwJqZ2CFjsUKocXHDCoNYxI4C0cRYPfDzT9eCy0ugyMg2jDNugZj+WXaqGE
	 WCGEdPlb4WWu1Xjp8ZQic/zqwr4nWxEgRTyQtLCjUlV9CHAIZjUn1bvLnrcfGQ+6/7
	 nUCqAQNuxPhZw==
Message-ID: <621c6223-d3b3-4e52-ab72-b8ca6b30f8d1@kernel.org>
Date: Thu, 12 Feb 2026 21:25:52 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] ASoC: Add quirk for Lecoo Bellator N176
To: Mingyou Chen <qby140326@gmail.com>, vijendar.mukunda@amd.com
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 venkataprasad.potturu@amd.com, Sunil-kumar.Dommati@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260213004246.16615-1-qby140326@gmail.com>
 <20260213004246.16615-4-qby140326@gmail.com>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <20260213004246.16615-4-qby140326@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/12/2026 6:42 PM, Mingyou Chen wrote:
> The Lecoo Bellator N176 requires a specific quirk to enable the DMIC
> support.
> 
> Signed-off-by: Mingyou Chen <qby140326@gmail.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
>   sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
> index 0294177acc66..de49c812124a 100644
> --- a/sound/soc/amd/yc/acp6x-mach.c
> +++ b/sound/soc/amd/yc/acp6x-mach.c
> @@ -45,6 +45,13 @@ static struct snd_soc_card acp6x_card = {
>   };
>   
>   static const struct dmi_system_id yc_acp_quirk_table[] = {
> +	{
> +		.driver_data = &acp6x_card,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "Lecoo"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Bellator N176"),
> +		}
> +	},
>   	{
>   		.driver_data = &acp6x_card,
>   		.matches = {

