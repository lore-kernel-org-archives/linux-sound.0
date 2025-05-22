Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6AD2561B8
	for <linux-sound@vger.kernel.org>; Thu, 22 May 2025 21:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747949659; cv=none; b=pYNk5w0zSn28T9BwF3gBE7LCI4ragL0zDW91Q1IUqq+tcRhMMhwzq3pn/E07rdFsmC80mYLvzHJrGA8nfexWoqYvReujWF5eryhg/OG9Bd7q7VqDsWNnFlffoyO3nm5o6QAPHMqbWRgVrtb+TFuVnb+XWCnVdYpH6iDfo2prLS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747949659; c=relaxed/simple;
	bh=YXE+jnHH3VPEadqBn1J+SJ0CXHyWAMyAvo1kwfEV5GY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iLYEcWTCsAAk4rk6ukvgNJxEyYxzOXJkEVXA+pldypM8k7AFOocr9njEnQEsiwBWo4w/mtuh73PQm9LHzOAI6Sp78A9dDGGbN0qfIWObg8NfNxv3DSKUqYnQ8gxcixvGtUoqaDJ4s2g4zR9/zr4VaYVG1gwvTY1EXPqPqZ0cjiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=gwpkZicF; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gwpkZicF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Mi2i+rW436Tqrb6LqiKZF7EewHFTHvhwoqn1sII6G4U=; b=gwpkZicFmPT9KagkxkpJjn281n
	65COqOJ/t85Mz6jLVNIEdM61Xv3B10T+sRc5tBSCcSC6ohH6qv0hGiRuUBJYWcSm48944jdHy7bXy
	uJayxU2HxQVtqcv8700c7APc+bveuFJqXA3t2vmkZms3i5+fcOlGYAI5+y2XFTG8CNOxrOQM9lqqQ
	WgrXaU+ZIVUPx++VATEv82XasoAprAN1pKpNjPF0+sInEqKqOlQMOLGqeMO1VW2kPM3dmv+ZrIHv4
	FpBLx7HfxMwdhY/Uhp7yzPh6abrsv4ZH7DjagOHp5CiV/GANzTI9u9LXo4jxCIAeJA/sOHFvk2V9+
	6oZHEp8w==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIDYL-000000015LN-0Hcp;
	Thu, 22 May 2025 21:34:13 +0000
Message-ID: <c3546a41-49ec-46e4-b790-e84d555edbb8@infradead.org>
Date: Thu, 22 May 2025 14:34:10 -0700
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda: acpi: Use SYSTEM_SLEEP_PM_OPS()
To: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org
Cc: Daniel Dadap <ddadap@nvidia.com>
References: <20250522204624.1757-1-tiwai@suse.de>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250522204624.1757-1-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/22/25 1:46 PM, Takashi Iwai wrote:
> The dev_pm_ops definition must be SYSTEM_SLEEP_PM_OPS() instead of
> SET_SYSTEM_SLEEP_PM_OPS(); otherwise it leads compile warnings without
> CONFIG_PM_SLEEP.  The latest patch version I took was back to an old
> macro (likely mistakenly), and I overlooked it at applying.  Fix it
> now.
> 
> Fixes: 4b214c9bbe26 ("ALSA: hda - Add new driver for HDA controllers listed via ACPI")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Closes: https://lore.kernel.org/20250522203020.1478369-1-rdunlap@infradead.org
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  sound/pci/hda/hda_acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/pci/hda/hda_acpi.c b/sound/pci/hda/hda_acpi.c
> index c90865ca876e..513f8fde198b 100644
> --- a/sound/pci/hda/hda_acpi.c
> +++ b/sound/pci/hda/hda_acpi.c
> @@ -293,7 +293,7 @@ static int hda_acpi_resume(struct device *dev)
>  }
>  
>  static const struct dev_pm_ops hda_acpi_pm = {
> -	SET_SYSTEM_SLEEP_PM_OPS(hda_acpi_suspend, hda_acpi_resume)
> +	SYSTEM_SLEEP_PM_OPS(hda_acpi_suspend, hda_acpi_resume)
>  };
>  
>  struct hda_data nvidia_hda_data = {

-- 
~Randy
