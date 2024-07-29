Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7393B15F32E;
	Mon, 29 Jul 2024 17:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722273439; cv=none; b=ikkbu6EDmH0tkwChxQ6zP6TfAu38gVhic6jX/2PVQGvNB68nMt1hHcAl2wIgUVnPT2WtHmDO+Nkqty5GCPPlQ3wbUTFnrhdrNxb6ZyQ0Oqo2hIU1Nnge7SFX/XoTJd5c2EEP6/mmpbqc6uLeg52v2Zkb/EzxRV3HAg9srflhzZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722273439; c=relaxed/simple;
	bh=ub2XiA1hn6+BNDRtOQD/sPOjh2gGpJW/+F3Q1VdfMhI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l8urUQwAPviA9X2wUG/pO4p2AyH3MqpMHJQsQyXsr45/HnFVTMDHvIKvB6fqJ0nmLrD/BO55Xv75/pp8f+uJA88bDLe2Gi7pqwap8MlFQQmEMc56TE/s6Fh9kSM02R34vdkQjrMg1ZN3vhj5Pm5l8VAvesszSMsoixjR4OnGvBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X+JLfyg3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X+JLfyg3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 918A5C32786;
	Mon, 29 Jul 2024 17:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722273439;
	bh=ub2XiA1hn6+BNDRtOQD/sPOjh2gGpJW/+F3Q1VdfMhI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=X+JLfyg3c2NX3tX7wRg2IeKF7YlAao4mH63kBi8XW7YE005iUnHJ1n3NfGGj8+ZPW
	 biDFN3tcPTnQB1r6/L3LU/RiPfu3mtLHsmm5P3cWk3jmND/9sEoM831lSQ02wK7Dg/
	 xNfBnyRIOL2RjcStQwfSMDCCYJib+tTSjW8EHokLMl5/OGkMnUvX56MHI9o/eQrQpV
	 xIkUEOOyFi3c497IOHyvNdNUtrIwQnPaYGuS2kg+PN0GNYNDN8cn7CTkcreU6tBuJK
	 QAbN1YFm954ZdEMRMOCZVAJODbeTKI7g27Ba+Ni8uhafUyZ3OvRF9VUwEsniXVaJOO
	 WIDHG+j882qkA==
From: Mark Brown <broonie@kernel.org>
To: Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240717134729.51661-1-animeshagarwal28@gmail.com>
References: <20240717134729.51661-1-animeshagarwal28@gmail.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: ti,pcm512x: Convert to dtschema
Message-Id: <172227343732.109775.15565180087385393576.b4-ty@kernel.org>
Date: Mon, 29 Jul 2024 18:17:17 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Wed, 17 Jul 2024 19:17:21 +0530, Animesh Agarwal wrote:
> Convert the PCM512x and TAS575x audio CODECs/amplifiers bindings to DT
> schema format. Add missing sound-dai-cells property.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: ti,pcm512x: Convert to dtschema
      commit: 00425bf8cbc9981bd975a5475cec4964544fb297

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

