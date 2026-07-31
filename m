Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD70459AEE
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 23:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785539911; cv=none; b=r7wkuFOqnctw1m/5cYFwJhSgogCldezoc6Hbny9Rmo6c7jh8ZGAsETYKI1zhdPhLqvpE0YdqwVatovUKxhDbQbFcGys9xEdk7Q1+qdycL+Irau2eFqvqlsBLXZtT1eN7LWVJ5tIMQ4Y9M6vlYtbhmoohvORyHq+w4rj3QPKa9KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785539911; c=relaxed/simple;
	bh=Y52YsssGkFhRpoSmyQoe4IRjA/dE0P3Cxn2KsIpez00=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QpvM1S13jJDMIlGvPwed0u+k1IDYWJ08NmMWSLT+R1e+XRsfP6Ylnv3PdtchcSgFDxlRlp4KHtKpjY7Nw1V0+MqIrj5x8r0TEKFeKICOYLzyNvoGjrQRjhcg01ufHdX0umItbpmkg4hLM7p07qf2T0M60HarAFqEfJbjv3zQnxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jmJ8pt9e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jmJ8pt9e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF85E1F00AC4;
	Fri, 31 Jul 2026 23:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785539910;
	bh=V5ss9qZBro51f4g+b7hNwAu0+UjJdOb5+fHQJInZWTo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jmJ8pt9eE7gJwDyP0KNu4XKtC7GNPE+Bbri+QsmT4Sb6AUT7ncd38Qp363tkZIIK+
	 GEKL8fkenCzHgL/0YO44Gvq4d6o26ACWryNU5DagG3B9o2MPuB5G6XLDAusrx2uD5q
	 yRpaNtDD3HHiE+oEcko/hyA8iqcyevn8BjwbjJ8B0n76+hwZCRgP7dGS//HFmzPsWA
	 gzIAQ2NThHJxebp9YogAM7rDVOrfZc4YobQUn/cRG6kpf60YuHO9woGm/dmbI3hEET
	 xxRPprqhlXOEYfOJGqzm1UP8TOywnWcNWQdnd3m9aGGBIHE5TvEyxlC0sSbgMIogSF
	 wIHJ+UyDY5gEw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 liam.r.girdwood@intel.com
In-Reply-To: <20260730125130.29887-1-peter.ujfalusi@linux.intel.com>
References: <20260730125130.29887-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: SOF: Intel: Handle ACE2+ link DMA allocation
 restrictions
Message-Id: <178552794264.353541.18058739096878496107.b4-ty@b4>
Date: Fri, 31 Jul 2026 20:59:02 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1893; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Y52YsssGkFhRpoSmyQoe4IRjA/dE0P3Cxn2KsIpez00=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqbS1DkoI+IazlNGms3uslTwyRy4fjNyRqQpGwH
 MMj8jKLMYSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCam0tQwAKCRAk1otyXVSH
 0CnOB/9xLuYIFt7YiQqUZqd7R60ZfvzxiP5UymGYZT6byo/Yam1HEJXVPX/rcwOnzGtLqkdbfzd
 egdnp2iQF03SShykUgdQTMRQznDV5+7fI4zKd46uGhLCnIaRfiLZhRBu6/56Sufj4T5pwufFs7t
 tL9sFLquJsutHmqzk4/UdMgqcIi4X0NPKOeuGMeHKo7exu0tPzCQ75vj5OazEOIaFic2b+CPVzj
 8t2f6Pr59e7eHfOUD9sq/bu/+VYUTO3mBQQJXxaSo4Jd1rZvJhTsqJIH1RcgvDm3Y9F6VOZ1TWe
 RApplgx80QhK2DxhV+PAkXm2Hu8X4u804hak2slsP3H4Sfit
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 30 Jul 2026 15:51:26 +0300, Peter Ujfalusi wrote:
> ASoC: SOF: Intel: Handle ACE2+ link DMA allocation restrictions
> 
> Hi,
> 
> We have seen cases when the delay reporting unexpectedly behaves incorrectly,
> counters are not counting in hardware registers under seemingly random
> conditions.
> It turned out that there are few cases that the driver must handle in order
> to make sure that LLP, PPLC counters are working correctly:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/4] ASoC: SOF: Intel: hda: Fold mlink enumeration into hda_dsp_ctrl_init_chip()
      https://git.kernel.org/broonie/sound/c/c1c90903a25d
[2/4] ASoC: SOF: Intel: hda: Keep non-alt mlinks powered at probe on ACE2+
      https://git.kernel.org/broonie/sound/c/9e6966f70404
[3/4] ASoC: SOF: Intel: hda: Remove unused hda_bus_ml_put_all()
      https://git.kernel.org/broonie/sound/c/154886853193
[4/4] ASoC: SOF: Intel: hda: Avoid ACE2+ link DMA stream allocation hazards
      https://git.kernel.org/broonie/sound/c/34d466aaa0d5

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

