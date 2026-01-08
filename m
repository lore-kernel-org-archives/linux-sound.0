Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBD72F85B;
	Thu,  8 Jan 2026 16:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767888070; cv=none; b=YX607CM9rUAEf7CkRaJAxQRb3IGcPXLgrbDnFI08uP/l2zxoXRwYVJqLKQtuOt6Vs0HjWzj7RUf7BEgEAMGrOteNu6q0jziAQTjdYQ43covRbTOOE5hoy7AwnzxBJdoQCk+m2uD1qdpbJrr7IUorG+Ddli6Bs3GMahezCG7+fYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767888070; c=relaxed/simple;
	bh=ViHem46U8cjqDiAqrAGqR0w1PC+0fyccEcVmmfUl5zo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=iaW9XYRWPAa7aWw8v8tFGU61sUyNiYR1DVWoGeRWTXukgECkoRkMtasEGCIitDpzsSibB/C2nhDqN9fG2jM8r7GLO1DMPe5eWsc1io5JNTMIp8Zj6D0ioVgfWfjoIQjt5IJIBRaegZSNWylTbAFh3QdGsXr/FV24XMpLAIsCqzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tRBiVA/a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tRBiVA/a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F17AC116C6;
	Thu,  8 Jan 2026 16:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767888070;
	bh=ViHem46U8cjqDiAqrAGqR0w1PC+0fyccEcVmmfUl5zo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=tRBiVA/aSNy375BguB61qy5/6LAousw+7koZ4sL5JENaygZrK4kz7k5ZvpIti1FD1
	 yoh8Iibce5H+gvZRC9AOPAPAnWpNOL6PEHa2lFHnvfjRrXHThyHi+hBn4RPV/d0+rd
	 K322WNE00eYG10mhgPoWblgCsb1c2Tao6iYIOQhXa5Y/s5VJFlXE/m7APQnYq5WJTY
	 RsAyS/RXzd5om1OLRN9k/9VT+BxErbVeVgsR4IDNyV9vh9uQgVB9m4EMnXR3YiUt0B
	 E9C6+E6Pf5BUS6UC7CtemreOl4zRCWmgd0OCB4bu1i+zWd+am3tg4EOUrGypct/3P+
	 PKgQchkLGPyNQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B5E3C3A54A34;
	Thu,  8 Jan 2026 15:57:47 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 6.19-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <87jyxsh8tg.wl-tiwai@suse.de>
References: <87jyxsh8tg.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87jyxsh8tg.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.19-rc5
X-PR-Tracked-Commit-Id: 9ed7a28225af02b74f61e7880d460db49db83758
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 108b661c79111ec163edb999825718aa57c3452d
Message-Id: <176788786631.3692767.11371770074499707506.pr-tracker-bot@kernel.org>
Date: Thu, 08 Jan 2026 15:57:46 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 08 Jan 2026 08:17:47 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.19-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/108b661c79111ec163edb999825718aa57c3452d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
