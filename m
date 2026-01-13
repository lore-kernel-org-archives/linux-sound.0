Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1101C38E5E8;
	Tue, 13 Jan 2026 13:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768312196; cv=none; b=QVNjjB545FyxqU6i9Y0SkGjN3mMWt9V6q7/6/k1JP+n3izMecXwL1/i3YW0/AjnKvHTVJIor4qy9dMXTAacnz4WuuTG5DGv5HGcQ2KFhImaAFPmk561Xlz98r9ORwkkZgw9KzfLE9KShxUaUaNDuLLgIVeLf5hyg/Cc9XiNSyAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768312196; c=relaxed/simple;
	bh=p98FtoqAXFNOtD2ZQ6r64ILT019grpNp4nJQzPaUEMw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=p2RWClr4+C/+inhxhm6EOOiaaRI023OOUHxziP4CDrir3QnPCMtRpH64+X+Gxc6s72s+cczOsuxdEM6vnTiSSBQGcRPzuPD9RONzS6hbw94zw2qoptuFuyk7SpQqY93uYydBDwtt2JEubXuRBg3TEmTZ7sPWTvQCHLJyXZ6IAQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NOcJT2k2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NOcJT2k2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2991C16AAE;
	Tue, 13 Jan 2026 13:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768312195;
	bh=p98FtoqAXFNOtD2ZQ6r64ILT019grpNp4nJQzPaUEMw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NOcJT2k2MN2KVBPuoChVgXNUzdNSQYkkqKUoHfB6D2jqwDBeV3AKNqDjjcqCkFl8b
	 MXiHlCtPOU/9TZFVpLLVWqCAr0/mKMYUwl+lY0BkBABI3cxsAwn3w+7kU9VGm9M3V3
	 KMqq2tDva2pcMkmzpwxO4wVAEJEsBOUjxjLcfrVe8Ak1t84NZofvXkerwuZuUQXe0B
	 6VHe8UvAobPn8lHCy2BSk5AUHXDV+84DFP5Ncqo92N8UPRua74ul+P5XGL8UVSPVgx
	 WWMXstrxCdKMeuS3VtEX7AKoPk2+SsDZKBTqFFYs1TmS6xroNejLl2vZeMgBflXKyr
	 sPbZZrh9dBtgA==
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cy_huang@richtek.com
Cc: Rob Herring <robh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 musk_wang@richtek.com, roy_chiu@richtek.com, allen_lin@richtek.com, 
 devicetree@vger.kernel.org, linux-sound@vger.kernel.org
In-Reply-To: <cover.1767948925.git.cy_huang@richtek.com>
References: <cover.1767948925.git.cy_huang@richtek.com>
Subject: Re: [PATCH 0/3] ASoC: Update rtq9128 document and source file
Message-Id: <176831219353.70484.6698601019095177736.b4-ty@kernel.org>
Date: Tue, 13 Jan 2026 13:49:53 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Fri, 09 Jan 2026 17:03:51 +0800, cy_huang@richtek.com wrote:
> This patch series include two parts
> - Update initial setting for rtq9128 specific feature
> - Add rtq9154 backward compatible with rtq9128
> 
> ChiYuan Huang (3):
>   ASoC: codecs: rtq9128: Modify the chip initial setting
>   dt-bindings: sound: rtq9128: Add rtq9154 backward compatible
>   ASoC: codecs: rtq9128: Add compatible changes for rtq9154
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: codecs: rtq9128: Modify the chip initial setting
      commit: daf86dcdbb40c4a0e4b8e579c6eecf148560711f
[2/3] dt-bindings: sound: rtq9128: Add rtq9154 backward compatible
      (no commit info)
[3/3] ASoC: codecs: rtq9128: Add compatible changes for rtq9154
      commit: 6be9ea62afedef0f976eb3dba4c117be0c1d3809

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

