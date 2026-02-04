Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4016A40B6E7;
	Wed,  4 Feb 2026 13:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770210190; cv=none; b=q1B0jn3kqvoxhFmC4BY0CB94TDa0AE1hU9abZNlO132xezrR7864rNUXyx67uhgXKSgpkecIiklISjHryFVQ9Vsla+4uTpSRC8w2DJW/B8tSbXkb/zIqrc1bOHHkLcN0WvPcKUh2XigX7Uxjrw8CcPnPaDqvCSbnmooU25Pvoxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770210190; c=relaxed/simple;
	bh=n8rNqrB2sTthf6NVyEee9YXiwP/2LrMsSu6Zji+6OWg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OsPYU4ud9Qy61hVhPhoC5lCNJlUmqiTZAGzD01S5rU2QIYVfxdKHCtg5Tuh0sy8BxGdjvYYb3Mp2sCMdYDAgOBKs7v/3NFq6IbDLE24dYos1wnagrN/qIb0TcqKWI7Kj+c2CF0SIlYIqEa30tUAyT88h4Zrlnswq6I2Zpph4j6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u+44IJQC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u+44IJQC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F8BBC2BC86;
	Wed,  4 Feb 2026 13:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770210190;
	bh=n8rNqrB2sTthf6NVyEee9YXiwP/2LrMsSu6Zji+6OWg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=u+44IJQCVUd53BQZpm9rvKrf6WvgQCBPh9cfEzBOAPp8ACrJy3cEdIRr3BwCjVAJt
	 rdEUf15WCtE8HsRIkni7PTcivOIgvJEYTwQ5eW7buvnwgeqM/MY8WpwsPOmbAoYIiR
	 rwWNJH19hWzGBMb+Z4SqqyyDZdbu5BUS6pfVM+ppbqWV/RBWqsInZLC9b/Gje6tt61
	 fEUZMCn7ZKEQIexUsRFfsA0PFkZ+IwKUISbvLVLE2Is5Xh/nz+o7Fsan0pJeJrCHp/
	 19jMFAwn+f3sdb4CI3yq8WZGeD1N/Oc2Y/cXWAuELynYC/XJfKcmoQeHFZ7ZnOWKka
	 kTV8WlZ2jxtRQ==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Ziyi Guo <n7l8m4@u.northwestern.edu>
Cc: Fabio Estevam <festevam@gmail.com>, 
 Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260202174112.2018402-1-n7l8m4@u.northwestern.edu>
References: <20260202174112.2018402-1-n7l8m4@u.northwestern.edu>
Subject: Re: [PATCH] ASoC: fsl_xcvr: fix missing lock in
 fsl_xcvr_mode_put()
Message-Id: <177021018786.97050.3676101017242233000.b4-ty@kernel.org>
Date: Wed, 04 Feb 2026 13:03:07 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 02 Feb 2026 17:41:12 +0000, Ziyi Guo wrote:
> fsl_xcvr_activate_ctl() has
> lockdep_assert_held(&card->snd_card->controls_rwsem),
> but fsl_xcvr_mode_put() calls it without acquiring this lock.
> 
> Other callers of fsl_xcvr_activate_ctl() in fsl_xcvr_startup() and
> fsl_xcvr_shutdown() properly acquire the lock with down_read()/up_read().
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_xcvr: fix missing lock in fsl_xcvr_mode_put()
      commit: f514248727606b9087bc38a284ff686e0093abf1

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

