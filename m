Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647EF42465B;
	Mon,  6 Jul 2026 12:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783339856; cv=none; b=XpdxoPqR85bGGHGfK7fUMsgRsNWp6nyGjXWbidiqnC772YWZffymF+mHZ3xOQY9aFo+3zCa56QlUGmlrVOBp0VQy3UuBToVJQfHxLGe2EVJnIRbQd4srwZD2mUmfRUn+HdUaAMbDumY5Wb4GaGNAx2OdUuaC/+2zXvf913Eg5nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783339856; c=relaxed/simple;
	bh=OoYt5/FLa8cfw+ebFTGdV7Ok9pvk/dN1eTsnx9v3r3I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KcQQM1IbadRzROyOf+eySwOpsw3f1CjWu/LEtTr9yY8SIBfmV1I1MrhpXMGBHXlLLP/hz7zc7KcDvCmxVdaAfkFRdiW/z1Y7d22udEEc2gHZXDu4Z9Ej3MKbwFvvm5JSLuqUV/Z7kLv4xVRTFazMaclmWwBEDw4QVuT41VHLA7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nXnWlBh7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nXnWlBh7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C8E81F000E9;
	Mon,  6 Jul 2026 12:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783339855;
	bh=8snBFycLLNi9qU1IeT3KB6bAs3SJcvGC3OYCjgzvXfM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=nXnWlBh76NylCYK6AVFUt0/27OcxlxECYEJ1uynKMGp7CzpsLG7/N07jTSSZKh/br
	 PvQ2nwgHUBxbZGflZFFPmn4tr9X8Y5oHAs+T8g9OW1YfqgIweBo9biELqxyY8PzYu5
	 YFDBn6QDiEtoYZ6q4OvnvWeYEOYHditP+yRCI4xDG2KUxmCLAbM67FwZIsvDMhUVqR
	 hGmiA9QJq8FpM7v+Do05xaVvGXcux7kDy5sK1IR+MBSAbGHlkzB2v62bBrpvpeFUDR
	 in5yqdOTaGB48I7d9eo/4w08gmbDmTXXVqGjCdJRceuEn74F1BZwyLNYF97V+CetCQ
	 CMbt4LYS0Vsiw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20260630013024.1500623-1-rosenp@gmail.com>
References: <20260630013024.1500623-1-rosenp@gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt2701: add COMPILE_TEST
Message-Id: <178333982019.57168.4166829438358170291.b4-ty@b4>
Date: Mon, 06 Jul 2026 13:10:20 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1097; i=broonie@kernel.org;
 h=from:subject:message-id; bh=OoYt5/FLa8cfw+ebFTGdV7Ok9pvk/dN1eTsnx9v3r3I=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqS5tM0nUKpujawiRpuMWmCY41b6wwmFjzwPU7y
 nlAUlwf1h6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakubTAAKCRAk1otyXVSH
 0IWJB/0btqNM6vlHAJ/MYKW3PR2aATMobzbzCatcnsuflfVS9G7UGsBNQY3M1ms+TrttiVLPjK9
 bwb8DUZmQK7+7lFnwtgwXddD8zkCxGCl47c3Xv9UuiglNxWIoiilMMRU7KKFWqp6nnwzHuS60MO
 YzFbHRuLpFKqzEMkvESjQfd6CkMWLVQ5Z5VHqjyfoYK3pL3zaMV8PBhKiPo2haxuCYNme3YlXpw
 YexPj3M4+lzy3oI2yyOejpf3h8u/aUCunUe0hJIHI43wt5S4AvtwC8YMsNF0QURsyMbAF3LLfV7
 U2WfsZKJiat4a/Sf3GPEPZxaVqrVRQk9EmdVNrGiqJ4ROLVv
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 29 Jun 2026 18:30:24 -0700, Rosen Penev wrote:
> ASoC: mediatek: mt2701: add COMPILE_TEST

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: mediatek: mt2701: add COMPILE_TEST
      https://git.kernel.org/broonie/sound/c/ae2e2f1ff1e8

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

