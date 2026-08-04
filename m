Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52140411A0B
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 19:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785872503; cv=none; b=Oe+BiaPPOAIBJOq3tZmTZMqC69u3GqOGZLj8jAmgRRs0XkoH7FYatY1fpXUyXVYD+xq85Ng25+gjH7a86T0mgssYaCYQ1tz7eq60n/CMLoqSHazN2lGNo36yqhgCxZfDuTvTqdJDQC6czHNUlFnplIghC0C2WthtelOBdnQuMNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785872503; c=relaxed/simple;
	bh=QsWC23eBq5AEdqRTVKVjM+IlXGbR/PHEp6RcezXjIyc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MpUTg8mQ8KwqxYHTbQviRFtCE8wG05qkczrnRDOuUv79iYyQO5BjQOQ2r989HoQYJri9e3yAgA1Vupzt9hA7aIybu5OLjBU5TD5CAGaWVF4WFHuRBelqoAMttL4a4iRDYeoIcADcIouL13NZio7S0DWLUIJFaZHBqaU4UENE4QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QbTLgzmv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QbTLgzmv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E8AB1F00A3D;
	Tue,  4 Aug 2026 19:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785872501;
	bh=gbNqfLDp2Rhl4StTiTS5cPeVqlY8rOq2rxi1sy3i6K8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QbTLgzmvm4PoK+Nm9qWNsbTFqvKbLZPBIX9wgpX5hLhxiY43mYZK/W3L3U5/2N2i8
	 Iic29Wapd451mT2osfxsx0rbKPFxuC4T5xokDvVI2u9/1CrbVUNtGcVB0eA3WXu32Y
	 W2O459LgZW/ax68Z6t0tefXM9FhgYfIxweMX0hjBeAR1M4vyTVFVE9V/FTgrnv72Dg
	 3fjvlXDSl8tTkm2zUzYvdMt0vzwDXPjTCqwNTMHJzJUBrpIn0xBMrEZRTm5nKrkBeb
	 LfBfSigSaGsJr57x5ni2gRubNNJtOHqNqDI4IAvfioCK9u562Dwkac94obo3GHxItj
	 6jhQejL96AC2Q==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 liam.r.girdwood@intel.com
In-Reply-To: <20260730121729.18673-1-peter.ujfalusi@linux.intel.com>
References: <20260730121729.18673-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: SOF: ipc4-topology: Pipeline params
 improvements
Message-Id: <178586107673.111355.7011537842872979024.b4-ty@b4>
Date: Tue, 04 Aug 2026 17:31:16 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1605; i=broonie@kernel.org;
 h=from:subject:message-id; bh=QsWC23eBq5AEdqRTVKVjM+IlXGbR/PHEp6RcezXjIyc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqckBzhQfJ9ZLkpAKOzupVsKvfOe7m0sNCnIYV9
 0Vf3t6uaWyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanJAcwAKCRAk1otyXVSH
 0DwoB/96yekqi9dForiMIqxh0ZlOH58EO53eiy6X0QPGSN1OPzElBxJ9AVDQ2LYtDFegxj4r/IK
 Ap9oB18cuZiqRqhFUBXzg89r6jVN5Kdty+w3LA0IjKB7mY4/9K/txw1ohRm1iDRIn4drbbHmTZj
 K2NwdC7H9db76QpR2nyPpgVMU35r9JpUWj2HK37khKD7llwFEX7LDp+lIXiqehRJRuZZVkbBP7c
 9lZw3ojbBnKdoHmOoNZBn5OnFQ9EweavDYzuStUFh51sAS1jceRM9LwVwpQTR6IOp/w/4nQgD/u
 0xBdc18qbLWoYNgb67OMsvxwca5Zc4kLvUf7KD7AoIdxH3YI
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 30 Jul 2026 15:17:26 +0300, Peter Ujfalusi wrote:
> ASoC: SOF: ipc4-topology: Pipeline params improvements
> 
> Hi,
> 
> Improve handling of some corner cases that are not used by current topology
> designs, but can be crafted within the rules of a topology file.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/3] ASoC: SOF: ipc4-topology: Store the params change between input/output of a module
      https://git.kernel.org/broonie/sound/c/b843df095061
[2/3] ASoC: SOF: ipc4-topology: Correct the process module's output lookup
      https://git.kernel.org/broonie/sound/c/c599f0f52139
[3/3] ASoC: SOF: ipc4-topology: Update the pipeline_params of prepared modules
      https://git.kernel.org/broonie/sound/c/94648dc65e66

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

