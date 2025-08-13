Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5002EA756
	for <linux-sound@vger.kernel.org>; Wed, 13 Aug 2025 15:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755097296; cv=none; b=k/jkPqBx/nOPAok0DkmOxgtT+dL8albbjjwSpQup1bHdBHjschMS2ktqTr/uwBZBU9dU6Di228UVscj/YrP4kxATYsAQayXsqw9I/jQVHYzp8eUynNo7r1mlJFGumzSgNAxdwIg7+y5DklWiWMullkUoVPk+PVMJya3M9uVwLRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755097296; c=relaxed/simple;
	bh=erECqfX/j18Ajh0WD/qqC0TNtON6POsP+wEC7ESQ4Dk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EQI+mmd8/A/CElpA9LqhmXf2B6WRNLHXarSPxruVTQiUbYKNg3fZThm0Hg9T2N1Biku9FLyHmS9g3Er/BmTWGHCLAXo6cM/mla/9lYfPOqpUDu73QfM5jyd4icrHvWRpEcyqwj2w/fEyIOBTzKoc9hcPF8Iu2/r5xLCWro2xJDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UfDIus+K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UfDIus+K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D62E0C4CEEB;
	Wed, 13 Aug 2025 15:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755097294;
	bh=erECqfX/j18Ajh0WD/qqC0TNtON6POsP+wEC7ESQ4Dk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UfDIus+KR1t89EoIW2zsWrGIkCGXLmKimNQbRjGnZcvWWk8s7nl66x1+0y3NSnES8
	 fB5xJ5xNVHnzDJXMd2xD1XJAGHU4MJyhlE9Jr94GJwo2pMBZIvGEZkI2+B3DZiCRNC
	 X7t2821DlCsvAH+qQzEcFr4fufEWqSMouo5v8Mp4TiUr57B9TAMX/uoIciY6sA6ulz
	 /L6AJxBTVpiKH9Gs2C6aqbQr8nwQHOxf9kcK1ws8AIPMp+CIFuzRKAgCFcpC/810D9
	 2Qv2jG/V78CTLxjLIRqeVYXAsXqxRxoBJ0UZAW/NDXq6EWZJupvuxe3pLBK3jusEt6
	 h+ZieRd6638zA==
Date: Wed, 13 Aug 2025 08:01:31 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/ca0132: Fix compile error with CLASS() after
 label
Message-ID: <20250813150131.GA2842554@ax162>
References: <20250813090039.20064-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813090039.20064-1-tiwai@suse.de>

On Wed, Aug 13, 2025 at 11:00:38AM +0200, Takashi Iwai wrote:
> By some reason, the use of CLASS() right after the goto label caused a
> build error with clang and hexagon arch.

It is because CLASS() is just a variable declaration and a declaration
after a label is a C23 extension. It becomes a warning in newer versions
of clang but that can still be an error with CONFIG_WERROR:

  sound/hda/codecs/ca0132.c:4222:2: error: label followed by a declaration is a C23 extension [-Werror,-Wc23-extensions]
   4222 |         CLASS(snd_hda_power, pm)(codec);
        |         ^
  include/linux/cleanup.h:290:2: note: expanded from macro 'CLASS'
    290 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
        |         ^
  <scratch space>:193:1: note: expanded from here
    193 | class_snd_hda_power_t
        | ^

> As a fix and a further cleanup, just move the code into the if block
> instead of the goto, and drop the unnecessary variable initialization,
> too.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202508131651.BZD3v2Bq-lkp@intel.com/
> Fixes: 8d0843bcdd00 ("ALSA: hda/ca0132: Use cleanup macros for PM controls")
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  sound/hda/codecs/ca0132.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/sound/hda/codecs/ca0132.c b/sound/hda/codecs/ca0132.c
> index 197365901fef..dd054aedd501 100644
> --- a/sound/hda/codecs/ca0132.c
> +++ b/sound/hda/codecs/ca0132.c
> @@ -4211,20 +4211,19 @@ static const unsigned int equalizer_vals_lookup[] = {
>  static int tuning_ctl_set(struct hda_codec *codec, hda_nid_t nid,
>  			  const unsigned int *lookup, int idx)
>  {
> -	int i = 0;
> +	int i;
>  
> -	for (i = 0; i < TUNING_CTLS_COUNT; i++)
> -		if (nid == ca0132_tuning_ctls[i].nid)
> -			goto found;
> +	for (i = 0; i < TUNING_CTLS_COUNT; i++) {
> +		if (nid == ca0132_tuning_ctls[i].nid) {
> +			CLASS(snd_hda_power, pm)(codec);
> +			dspio_set_param(codec, ca0132_tuning_ctls[i].mid, 0x20,
> +					ca0132_tuning_ctls[i].req,
> +					&(lookup[idx]), sizeof(unsigned int));
> +			return 1;
> +		}
> +	}
>  
>  	return -EINVAL;
> -found:
> -	CLASS(snd_hda_power, pm)(codec);
> -	dspio_set_param(codec, ca0132_tuning_ctls[i].mid, 0x20,
> -			ca0132_tuning_ctls[i].req,
> -			&(lookup[idx]), sizeof(unsigned int));
> -
> -	return 1;
>  }
>  
>  static int tuning_ctl_get(struct snd_kcontrol *kcontrol,
> -- 
> 2.50.1
> 
