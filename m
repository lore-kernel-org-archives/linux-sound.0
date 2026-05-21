Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648B33CC314
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 10:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445368; cv=none; b=mui28xilFYQzfhQf4wBeA2ZDuyeROu9S6ngBPMUFG4VnM0lOautI1BMhZkm+NODilkNmpg854Y/jZxxfRXRWLiVI9iVuEdmtU7XaZSS6eGbixAzKz8b6QoYED4+6CT+Q5dnklNZSUyienUP+lGdOxLQo2Iv/mPFx8JW2fq0LTYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445368; c=relaxed/simple;
	bh=OWbtYGx1M/BD11ZoFAOO1mZK0wnCdaK+BkmScZ9j+M8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Okz97w/fzXVFVRrmljRLsDOTDttoV0aE8kj0ZzWiiPpVynMrGC8tKvj8/G7Mh8XtDchU3Z0N+H51y1cSe9CG5A+u8Ltb5dic0kcHhHj+t+xWuHHrqQfBbsLAvM7hQOd45p9oRTLXPQ1U8MWGXT4d1+94HOYPDaGwJPD4gd0lZi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O06lV1sy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O06lV1sy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51CC51F000E9;
	Fri, 22 May 2026 10:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445367;
	bh=+GLyT4KI5J5kKsgCJROM5F5/a7QALYdkhTJl1WpQ85I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=O06lV1syxJYiDPhJ+UgpnxazbTe9n0ZWmdwP5rkbKEj17o51HjblmiywnrUy9FUs7
	 kTuXwKrgq3eeFCSs2dCGLDGnppumTYGw+4MYQk4/ui4RDNatWvhGuVZ6zz1716EYBe
	 OW7MdgO90MAcNN4ifoc9ebybM5s/vgtaj4yVAw4MWuFMupflJuFoW7StwgzlvC5TGT
	 1k5ZVbev4j8qqmTa3l1u/9ixatfNijGTK6M2sO+E9eNEbPxPJAgiw1JMGWzvwtHH/o
	 eN/FyzUj9OPtoLMUiFIqvZ2BZ6UpmsjjYtAdrIXBbh9zkAmmKm7jgArUZXp7W6ncKd
	 9HSddriEWVhWg==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com, 
 peter.ujfalusi@linux.intel.com
In-Reply-To: <20260520061143.2024963-1-yung-chuan.liao@linux.intel.com>
References: <20260520061143.2024963-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: soc-acpi: Add entry for sof_es8336 in NVL
 match table.
Message-Id: <177938723980.58022.2380377741205435120.b4-ty@b4>
Date: Thu, 21 May 2026 19:13:59 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1149; i=broonie@kernel.org;
 h=from:subject:message-id; bh=OWbtYGx1M/BD11ZoFAOO1mZK0wnCdaK+BkmScZ9j+M8=;
 b=kA0DAAoBJNaLcl1Uh9AByyZiAGoQLnWjFh30vGTjUmcoCFcYAK4OP8b/WxcpRKy12/spsTgfk
 YkBMwQAAQoAHRYhBK3maKpnVxi1n+Kf6iTWi3JdVIfQBQJqEC51AAoJECTWi3JdVIfQ/5EH/iOk
 5OXdm++jMpnmKG4XK1RXpMKUPGKcecL3AR8uQl3Qh6zA/KbEsa6efYs+9FVrsVXauIjCKjMIZWG
 14fiuexk+MymGox/3Gr3G0PZ1+RbUIl9XKdetmF4GNrs3h+Gg70tmUzNyotZH3q6FgKZeRXHp/a
 Cuoak4ltWcgTXu+UjU2N0xatRnYt4yQhXhwUD53cTHT0bW9E6TzHyM+fj1U9Qf5tqpMrnm53Gp2
 2XF5AVWxFRwtAV/jDiyNvGua0O+1ATJ4bNq+h6Vavjp+2EmKKGbxXS4Fi0RLf1zf6zVMtqfunq6
 oKHrmCL12ibbaPT57JZq1NZG7tDMokXsv3BQFeY=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 20 May 2026 14:11:43 +0800, Bard Liao wrote:
> ASoC: Intel: soc-acpi: Add entry for sof_es8336 in NVL match table.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: Intel: soc-acpi: Add entry for sof_es8336 in NVL match table.
      https://git.kernel.org/broonie/sound/c/2b8305f24a61

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

