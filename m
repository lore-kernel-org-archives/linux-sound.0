Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8968B2264A9;
	Tue, 21 Apr 2026 20:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776802755; cv=none; b=QilTXiivnpV21KHMXyR+fhtnT5sluImciyqlqqtr+96zJacUkaR4vuLennMtFKt1d6xm8UGHkyjZk+DUdpgwSpGbwLCJSTNg44tLIVzRZodttWZnYdESdCdrlstszlC/1Cx7PLGLBTmySDdxSA0Vc908Zu/GdDoinhZHxl7zYwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776802755; c=relaxed/simple;
	bh=XS4RLHgtC4b9A4YOSP6YpVTorVjVmi3pWSHv7m1/1T8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KBK0vwX8jJlbOOMHdHnHTfQBOf3BX0O37LOpaGeF50g+GamuCKNvG9nOs7gFiehKE9tSPJ2nD8w07pWd4hW1l6MUtMyjlH/bVYghnfMfnmIqxMM+r13TUXagRUAQve+FYt873ggNGWrqIdciLJsNdtP0QprDKVN9BSbKuU7ig4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pyFSOfKM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pyFSOfKM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776802751;
	bh=XS4RLHgtC4b9A4YOSP6YpVTorVjVmi3pWSHv7m1/1T8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pyFSOfKM3FYMbCuG3wFU51vIiMTtHVyW0JdWVeC3nanQsqeXwv8BAmVuenv7paHK0
	 KjIKSAzsvtEe7h33coegh0GQq8ZvdvDL840SFkzQsR4RvmVjbR5yJTWHzGVZqY6ADV
	 Vq0/sIwAxCQDHp9y9ysLgHcKULBarfzwHm6CSYLv5l5ecq+Y2YN2VN+pkqsiKE5OXy
	 8JsAxqS/abfUveZOJRbT+xGqSnSwTmRs7T65LP8lV04rbXJL3e/JFvo9KiEo2Xr4fw
	 fd7o8J32lNL1Uz5j/qTyjwFu/r750rt+8/3+wq/3vpXdxKfK9tpYo9Kfo2kCEkUPwg
	 hSptpXheFjrDw==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0FB1D17E141B;
	Tue, 21 Apr 2026 22:19:11 +0200 (CEST)
Message-ID: <e27dfa2e-ebe9-4cc4-a2ab-6f1f8140bbdc@collabora.com>
Date: Tue, 21 Apr 2026 23:18:50 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: acp: Add DMI quirk for Valve Steam Deck OLED
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-sound@vger.kernel.org
Cc: Vijendar.Mukunda@amd.com, venkataprasad.potturu@amd.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net,
 Mario Limonciello <mario.limonciello@amd.com>,
 Robert Beckett <bob.beckett@collabora.com>, Umang Jain <uajain@igalia.com>,
 Melissa Wen <mwen@igalia.com>
References: <20260421192214.77819-1-gpiccoli@igalia.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20260421192214.77819-1-gpiccoli@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Guilherme,

On 4/21/26 10:17 PM, Guilherme G. Piccoli wrote:
> Commit 671dd2ffbd8b ("ASoC: amd: acp: Add new cpu dai and dailink creation for I2S BT instance")
> introduced a change that "broke" Steam Deck's audio probe, in the OLED
> model, as observed in the following dmesg snippet:
> 
> [...]
> snd_sof_amd_vangogh 0000:04:00.5: Topology: ABI 3:26:0 Kernel ABI 3:23:1
> sof_mach nau8821-max: ASoC: physical link acp-bt-codec (id 2) not exist
> sof_mach nau8821-max: ASoC: topology: could not load header: -22
> snd_sof_amd_vangogh 0000:04:00.5: tplg amd/sof-tplg/sof-vangogh-nau8821-max.tplg component load failed -22
> snd_sof_amd_vangogh 0000:04:00.5: error: failed to load DSP topology -22
> snd_sof_amd_vangogh 0000:04:00.5: ASoC error (-22): at snd_soc_component_probe() on 0000:04:00.5
> sof_mach nau8821-max: ASoC: failed to instantiate card -22
> sof_mach nau8821-max: error -EINVAL: Failed to register card(sof-nau8821-max)
> sof_mach nau8821-max: probe with driver sof_mach failed with error -22
> [...]
> 
> Notice the quotes in "broke": it's not really a bug in such commit,
> but instead a problem with a topology file from Steam Deck OLED. This
> was discussed to great extent in [1], and Cristian proposed a pretty
> simple and functional change that resolved the issue for the Deck's
> issue. That change, though, would break other devices, so it wasn't
> accepted upstream. And the proper suggested solution (fix the topology)
> was never implemented, so Valve's kernel (and anyone that wants to boot
> the mainline on Steam Deck OLED) is carrying that fix downstream.
> 
> So, we propose hereby a different approach: a DMI quirk, as many already
> present in the sound drivers, to address this issue solely on Steam Deck
> OLED, not breaking other devices and as a bonus, allowing simple patch
> up in case eventually the topology file gets fixed (we'd just need to
> check against any DMI info reflecting that or the topology/FW versions).
> 
> The motivation of such upstream quirk is related to users that want
> to test latest kernel trees on their devices and get no only non-working
> sound device, but seems some games (like Ori and the Blind Forest)
> can't properly work without a proper functional audio device.
> Example of such report can be seen at [2].

[...]

> diff --git a/sound/soc/amd/acp/acp-mach.h b/sound/soc/amd/acp/acp-mach.h
> index f94c30c20f20..edf5e479afd4 100644
> --- a/sound/soc/amd/acp/acp-mach.h
> +++ b/sound/soc/amd/acp/acp-mach.h
> @@ -26,6 +26,10 @@
>  
>  #define acp_get_drvdata(card) ((struct acp_card_drvdata *)(card)->drvdata)
>  
> +/* List of DMI quirks - check acp-mach-common.c for usage. */
> +#define TDM_MODE_ENABLE 1
> +#define REMAP_DMIC_BT 2

Since the list of quirks may grow over time, it might be worth differentiating
these macros from the common ones — either by adding a `QUIRK_` prefix (or
similar), or better yet, turning them into an enum?!

Regardless,

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
