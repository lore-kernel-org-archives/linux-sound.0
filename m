Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFED3328F7;
	Wed, 25 Mar 2026 18:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774463477; cv=none; b=LnlYA+sG/lNSopVt+XuDEZP1A+bDeaydPJMRkc9pKOMAC0F/8t9pr9pgG4sHCVx4dsB/XxTkH/wCfzOkGw/dIkL+08QtJcUBB4QgwuZhvn3dTm/8QmDW9GykeXeoE7J/CobMicXDIn00AaFKksh3BkQIcwpHAKAPhud2gIW/M5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774463477; c=relaxed/simple;
	bh=zhL9JB+DuwQd/luUpJG23uHoZ0unzfZ6/vWh/SK4hMY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bCQvbayKe2IFH1/c/XFKdhdC0+4on/y5t8N/W6xQcRIfAeoe21GlKg6tHOFlALuql0sKYCNUef//7cm8XqDxSNHDApsff5wAZ6njyxwR+aWjmsfxNslALbbR2N34KswHXXkpfT3a6lxBK/1Fucz5fdNvIJpck5aJjAczlAuxhDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UeEBTn07; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UeEBTn07"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7560C4CEF7;
	Wed, 25 Mar 2026 18:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774463476;
	bh=zhL9JB+DuwQd/luUpJG23uHoZ0unzfZ6/vWh/SK4hMY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UeEBTn07QXI0wYZsn7sDnlX2vXOgFtcePh74PIwFP4IU5vuLmZgOWtM0TblBik8Kj
	 jEgDrcV0urj5br8rfs5wgFF499xJPQ0vxFGK/olStGJdZUcoOa52CpCthaHItb/pUD
	 Ooa/yorz48uRbvU/ikfnuMhguSpMuhO0D4/tBcdCxSvWmeBooVVnExJvG8UEG1ErFK
	 P0xeINjqCt7mtavXhPNY7d+X+17TTXqKAyKJ3qdw+6+ZhE2kVbYOoDzMjvgd2mTavN
	 W89pCc0xEO0zQOVkMqPvccjzGHVBrni9taOuC6wcrLqGH0mOljT2dqP7Lc3wU2bn7w
	 FLc2rwCtGdnVQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Kexin Sun <kexinsun@smail.nju.edu.cn>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, kuninori.morimoto.gx@renesas.com, perex@perex.cz, 
 tiwai@suse.com, linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, julia.lawall@inria.fr, xutong.ma@inria.fr, 
 yunbolyu@smu.edu.sg, ratnadiraw@smu.edu.sg
In-Reply-To: <20260324041400.16217-1-kexinsun@smail.nju.edu.cn>
References: <20260324041400.16217-1-kexinsun@smail.nju.edu.cn>
Subject: Re: [PATCH v3] ASoC: update outdated comments for removed
 snd_soc_new_pcms()
Message-Id: <177438195717.322033.1830244473384841196.b4-ty@b4>
Date: Tue, 24 Mar 2026 19:52:37 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-6cc06
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137; i=broonie@kernel.org;
 h=from:subject:message-id; bh=zhL9JB+DuwQd/luUpJG23uHoZ0unzfZ6/vWh/SK4hMY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpxCnw8PM6nPSUVkOAUhwfwGoTGQ59Jkaht0WmE
 iBGT9u4w/WJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacQp8AAKCRAk1otyXVSH
 0KJ9B/93qorpJGpvqwMkSEHjrcv+u21HEzvIbGwFEWm8F54qP5+pON/dD8hw+Krumgzxi5RWU2e
 DM0fJT0zeW2Bq9GRfkHglUIc5wy4dafPrMpSnM67TXU33e7JU95GU67qI8jEpRPDtEsQ3dQT+QE
 Di8Mck1lLxSYKpHCo2JAaAcV8lG0m7tfI1S0xkC8CBIM73yv19VPdyo+p78N181ygz24g6pKLfJ
 aI0mrBrPwUdooruJHDJE3Ke9BlU9sh7CwlnrrE28jdizhffpOFsf9GulUY1McL6+bUuccR2f8Ai
 ohTCrIMeB3Xj5EEmHP5YwBRUm+07a8y76zj2HAVA/edGfTV4
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 24 Mar 2026 12:14:00 +0800, Kexin Sun wrote:
> ASoC: update outdated comments for removed snd_soc_new_pcms()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: update outdated comments for removed snd_soc_new_pcms()
      https://git.kernel.org/broonie/sound/c/3e839947b842

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

