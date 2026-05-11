Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58F73B27D0;
	Mon, 11 May 2026 09:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778492616; cv=none; b=eC3Wk47CBwknGChIayrUJNMkUTAKQJumgULxDeMdWbsgrVkq2HsEmLQenCLtNrl6Pcpn3hS3SHKdGfaGhoI4CkO7IpTqWW6XLiRlFZaADGlvTp2aVS4AO3OBMS71OyXvPuVJyV8mT093zMioTY1qqhjMwrBXAU3MP/VnZecbG7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778492616; c=relaxed/simple;
	bh=yRisWRad3Z1sTyLfN1Qf89CUE4mBX1+7idpxxzAXLV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=b0dVdewTGWQcksRHRNfWr7dua8YimLA9z1/EWw5eUkkwcNoqezxUwBeZ3Ytxtzv/+7NF6icTIrsTdrMMvaj54B5lubVSx+pBNOxfqiLEgMKoPZC/or93o1eOhCEJ91twGC4nPqs4Jat2e8VvNY3t9nI1J0gF2bIV9udvBnE/KVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Dy6RZcvE; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Dy6RZcvE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778492613;
	bh=yRisWRad3Z1sTyLfN1Qf89CUE4mBX1+7idpxxzAXLV4=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Dy6RZcvEQz+N2xg+8J96IKI3Wh86vGsWIfPyzwn5b4rOrZffCMdtFXQeZQBtckrTa
	 tMqQjX+peub31FChPsX9mCTyJg2q3uUPz0t5y0j6fAWrOLbDtJEOq4jemBhbeMnC0n
	 +fwfJg14f9jxBDd6/Kezslc/mOKjwL4Wq1lX5HpBkmXgY3s64IxWjXX83w4D0nuJSa
	 B7mEwl0oHPqECLWBf9YEinoWnMbxjwZAiLLLiGtjukdxCUvWSvqg2QgkIpAXQWPmCl
	 4FpqFyHlLfnxcHMQK5N9LJnuWP5hVLVHdfb3XtWhYL/agbdchSuGbFHXjbEN9+peqX
	 +u5Tf7GKORtJA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4DCDF17E040C;
	Mon, 11 May 2026 11:43:32 +0200 (CEST)
Message-ID: <a17c683e-bf8e-4216-8459-66eb85329b17@collabora.com>
Date: Mon, 11 May 2026 11:43:31 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] ASoC: mediatek: mt2701: HDMI audio support
To: Daniel Golle <daniel@makrotopia.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Cyril Chao <Cyril.Chao@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Eugen Hristev <eugen.hristev@linaro.org>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <cover.1776998727.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <cover.1776998727.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/24/26 04:48, Daniel Golle wrote:
> This series wires up on-chip HDMI audio on MT2701 and MT7623N, from the
> DRM bridge down through the AFE into a small machine driver that binds
> the AFE HDMI BE to the HDMI TX codec already exposed by the
> mediatek-drm-hdmi driver. Bindings, DT and a BananaPi R2 board node
> are included.
> 
> In order to survive vblank or late hotplug of the monitor, the fix
> submitted separately [1] is required as well.
> 
> Everything here was developed for and tested on a BananaPi R2
> (MT7623N), which turns ten years old this year -- a nice occasion to
> finally land HDMI audio for a SoC which was truly ahead of its time.
> 
> [1]: https://patchwork.kernel.org/project/linux-mediatek/patch/a3e22cbae528c9a38d854a586d1736b860998d41.1776265222.git.daniel@makrotopia.org/
> 

Whole series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

I'll pick the devicetree bits after the ASoC and bindings bits get picked.

Cheers,
Angelo



