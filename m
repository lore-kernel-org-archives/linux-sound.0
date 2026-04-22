Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EE336C5A1;
	Wed, 22 Apr 2026 07:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776842625; cv=none; b=gYaf+yjtlDRbe5MtDhR3SdcNSFLUxBqaNKL5F7VYl5b7+lWyC/Ww70YbDra4FFsJGkpCM03ZYrv15u6n2ZGdjz4cQauEoGKohubeRyrYg//VoUBQzc35C2Hd2H1d0FxAHkOniH9yqKA4AhjQ8LmeV12x/fkFGYWzDzutqre8ndU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776842625; c=relaxed/simple;
	bh=U1ij765Jsgyab3m+Pw8LxQtm6XxGjDqoXz6QoaxBu5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P9+fM3xaY+5qaM6kCfprSZv1NLHV/W2zkhSKiv4EVC46S9bbBRpKDnjBB9VQ1T2p8bBSMVimQeNwz73DJvq0BD6HzDl2SJ6tJ9d0LDXTYqm+aqMzKSF5QbHkHKv8MQUTtJoo6nHiDrj8KapZMMan0I4zOHzBG5zvPoQFu+hF7kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B2sMocZo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B2sMocZo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DFACC19425;
	Wed, 22 Apr 2026 07:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776842624;
	bh=U1ij765Jsgyab3m+Pw8LxQtm6XxGjDqoXz6QoaxBu5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B2sMocZos1sITvRnYLPtTnqR8duPdHl9cgcOtp6ykjMRmHSZyCrR+zbs++sZEQ1Ex
	 +yR2IS8MfjCyZi/Fsl30hYJJpTqC5mNl0mtxXGhFJmKiq6U0nRXWmWF892rgytsxUB
	 +rfq+yAhL7TyzK7TqlxtDBh1M1vZwgrMxHX2jOkO+3wj9QoQSphxh4gBE/9QrzAa32
	 SOlfPLNZUB+0Ik71N+hUGflS/Ma0wIgqXaveVeZZ7CFX2FlvN+woX30hxBOPWbwwja
	 RcBQttTqKdVeuP/XZvZJ0i3Au5w9p8mDkjRHz4nzDQS+d1xmaklSa22JMija0wIqnV
	 shZWoQyTmDjNw==
Date: Wed, 22 Apr 2026 09:23:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Arnd Bergmann <arnd@arndb.de>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	=?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Eugen Hristev <eugen.hristev@linaro.org>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 2/9] ASoC: dt-bindings: mediatek,mt2701-hdmi-audio:
 add MT2701 HDMI audio
Message-ID: <20260422-mighty-rainbow-porpoise-c98f96@quoll>
References: <cover.1776646435.git.daniel@makrotopia.org>
 <072c4db4a01ac125e9ee5e34f992cd169c78e117.1776646435.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <072c4db4a01ac125e9ee5e34f992cd169c78e117.1776646435.git.daniel@makrotopia.org>

On Mon, Apr 20, 2026 at 02:13:13AM +0100, Daniel Golle wrote:
> Describe the sound card node that routes the MT2701/MT7623N AFE
> HDMI playback path to the on-chip HDMI transmitter. This is
> separate from the AFE platform binding (mediatek,mt2701-audio)
> because it represents board-level audio routing between the AFE
> and the HDMI codec, not an additional IP block. MT7623N boards
> carry the same IP and use the mt7623n- compatible as a fallback
> to mt2701-.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v2:
>  * Fix subject prefix to use schema filename (Krzysztof Kozlowski)
>  * Rewrite title and description to describe hardware, not driver
>    (Krzysztof Kozlowski)
>  * Clarify in commit message why this is a separate binding from
>    mediatek,mt2701-audio (Krzysztof Kozlowski)
> 
>  .../sound/mediatek,mt2701-hdmi-audio.yaml     | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt2701-hdmi-audio.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

