Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764DA221F1C;
	Tue, 24 Mar 2026 00:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311127; cv=none; b=ratSn4oRQ73vfIZieeeIpWvxpL9Sgia+vlx9jVwKvOqD4/hkz83TkEkl04GT1Vbv+BjZWi2vlb+9IuLwXnZpbe9R9ttdMOcv918wsgKjYYISKQRrOdW10dI+ejRZLlokBZUr+Zf7jxlI1L4O6Uy/qyQKBFb6r6dTXMdbycwRCo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311127; c=relaxed/simple;
	bh=byOxf/68ozuHzLPRP/nbFU9C+E+VeHXGOa0F7OXgP7M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=B4/SWi66NLIosqqcXpSXh6yPbF5iM1nITQNJ/8oTNPqWZX2CrczIMWPWinzOZ+QXu1eZzjewCbM/SFN8hG8jsdXk4isbIG/bih6a2fisP7Ph51mi89HGDKHeQBJnsUgRyn2QC6Q/UKTq0EmDt/W7HtrHZMRPy1dFzWLRPHY2oWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bbZl1PJC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bbZl1PJC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2E5DC2BC9E;
	Tue, 24 Mar 2026 00:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774311127;
	bh=byOxf/68ozuHzLPRP/nbFU9C+E+VeHXGOa0F7OXgP7M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bbZl1PJCD4vY14bMirpFwBCSs3HanRmR/wBlo63l/0Id+Xs7eEQJwE394hwuUwSfO
	 V9lPgaUWyf4fCF3LZ/3nGBDMsOCrtXZ2qRvUnNjo6Is5ZJYGrH6Tk/YRiUk8gkiGzP
	 weHlSSCvKHyTprfSNEr8vBY1kNcAEMSpdAfSqj69PsmfjtcFuf/m8VuR8H+mI2dxMh
	 W7y3T89Y3SdM4bOwux7s6nvRTrSNTJ46+MQ9dQwwmLtgAnafw0RW+JQNtqzYT9zQOs
	 patdUbWvnRvOqgzcPIYnH2mBexldYYKhfimKpjjWAPtNLwl4lth6Ga+XxBLb3WJnd+
	 IRU5Gk4EZdx8Q==
From: Mark Brown <broonie@kernel.org>
To: kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kexin Sun <kexinsun@smail.nju.edu.cn>
Cc: julia.lawall@inria.fr, xutong.ma@inria.fr, yunbolyu@smu.edu.sg, 
 ratnadiraw@smu.edu.sg
In-Reply-To: <20260321115018.9481-1-kexinsun@smail.nju.edu.cn>
References: <20260321115018.9481-1-kexinsun@smail.nju.edu.cn>
Subject: Re: [PATCH v2] ASoC: generic: update outdated comment for removed
 soc_bind_dai_link()
Message-Id: <177428889107.468511.13192604775382028549.b4-ty@b4>
Date: Mon, 23 Mar 2026 18:01:31 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=openpgp-sha256; l=1155; i=broonie@kernel.org;
 h=from:subject:message-id; bh=byOxf/68ozuHzLPRP/nbFU9C+E+VeHXGOa0F7OXgP7M=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpwdbTTJAG0g96Y6OEtfpGEjXQWVLCEStcZRE9S
 MZC9NFOsI+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacHW0wAKCRAk1otyXVSH
 0GemB/0Si96JuFCIgo55NWJ8Y5EoVhzbI9adKwTDMkHZwq7tCUsKr9mz93Pk7aChQktHhxlGeBH
 EEEB7WuYlXzZXjSF6GT9B1t/tHykoUu+hLcRXevPa2Nw2W5uvF+QinZ1iVs3aLdieSbBX46xTvo
 /XM5wjK0HoZ28G3C7HvR+g+dgg6+juS5Mk4uK2f0jF7Idv1Cm9eI3PDr1hWjqjAN0xoLIY+eRvF
 jSJz4T6J87JrOAt2FJ8mhNtwC5UnxJEqzLbRJK0n1Q0cKFm3NSDbC+D5G/8EbLNkGkCb/2gclBF
 JrCrIXao7vGfviaggX7ULtqd66xOdwUm59W16lb4aB6D0OxD
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 21 Mar 2026 19:50:18 +0800, Kexin Sun wrote:
> ASoC: generic: update outdated comment for removed soc_bind_dai_link()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: generic: update outdated comment for removed soc_bind_dai_link()
      https://git.kernel.org/broonie/sound/c/d57fe7b02072

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

