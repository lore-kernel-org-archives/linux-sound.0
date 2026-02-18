Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5091A293B75;
	Wed, 18 Feb 2026 15:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771427894; cv=none; b=tB2bZIaxYambq67iYFmaWg4gGQLnjuWcHvK705GKzUEo7ouj34OmWbIxPYgo3KZTXAF4yoUaN3p/V49TaKC+2wlcdmJw0U0zuK+a5Jj7P87D4qFp3z3tAhNQ+jAtYwxgJ4yYslRGlblDpayjFde5g9UeVTtYQY8kF1yPAS439s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771427894; c=relaxed/simple;
	bh=PM/Uu2f8zmPIzVw+igFkjhrmaVqko/YFD5SiD0naaSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G6lR5RpLT3sv0XREXRndmEWS4KzsfBaD6/BEN7o5V07ln0LVNKXkI3k1xSgBer8yszR9XeE7Tf1/kbNZUob2c3w538uTDuxM8orxu8nHYRTKO/pSVf2fqFfbReeFNK/UL2BgVIFJXy/qGUTZKY8TL8biiGpRIVNXi+vgMShTU0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l3m28IWg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l3m28IWg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 485D6C116D0;
	Wed, 18 Feb 2026 15:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771427894;
	bh=PM/Uu2f8zmPIzVw+igFkjhrmaVqko/YFD5SiD0naaSc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l3m28IWg9BQhM1eZew6wCEio4p6zbSeJZWzfJ1jG8GgrQ1X3BATgeSDjff/PoBuu0
	 tb6zOQKbVt5a7VsClVYHIkjRKjwXpHbt+eo9GDt1Gegn1S9gF01aCh2Bt6cRkG8Qrw
	 72EWjNoqQOq8MYx1MvZOL+Ff6Qn6A/cGUpaXGqRZeVbdiGSp2fnipnntgcsYeetQHf
	 bc+TIfwypYOwO+NC4rknzQgeyq4AE7/k2XN/0963N4SfQU18TfCp1WKfxPWKiW8Z71
	 SIx4DXuMyzWuVdnT3ZwRuJZ9L/PFUozDXC1iDnrmiOAL7yFFbPMI0jQBe3HZu7ZcQd
	 LnBFgMsppUaBg==
Message-ID: <b9dc73ea-0157-4f4c-9c62-8a3deb5b9bcd@kernel.org>
Date: Wed, 18 Feb 2026 09:18:12 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ASoC: amd: add ACPI mach entries and quirk
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260218104734.3641481-1-Vijendar.Mukunda@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260218104734.3641481-1-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/18/26 4:45 AM, Vijendar Mukunda wrote:
> Add ACPI mach entries for ACP7.0 platform for RT1320 + RT722 combination
> and include machine driver quirk for Lenovo laptops.
> 
> Vijendar Mukunda (2):
>    ASoC: amd: acp: Add ACP7.0 match entries for Realtek parts
>    ASoC: amd: amd_sdw: add machine driver quirk for Lenovo models
> 
>   sound/soc/amd/acp/acp-sdw-legacy-mach.c  | 16 ++++++++++
>   sound/soc/amd/acp/amd-acp70-acpi-match.c | 37 ++++++++++++++++++++++++
>   2 files changed, 53 insertions(+)
> 
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
