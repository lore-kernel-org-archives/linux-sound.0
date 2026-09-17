Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9841E3ACA59
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 22:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789683289; cv=none; b=mSJTzclCwQ9HD71NFciEIsekHJMqtEohjlZ360+gBCsjpavAKFPXWy9ptA31itjaTlUR4MaTb16dWGMGgtHWcPaD45N881gQj68+FESRQo8SnLroYU7dk+G/fHQh3sLk2ozAOn5nqsncwtNeyChEF1WvWAULQW7CC8SfdaQM5gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789683289; c=relaxed/simple;
	bh=ba+kuQU3AOx1eiVpm1PJ9aqoQNnMVSYLGwIvL9wLSE4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=a8Cr1xrmtMxt+pDVcSuK9vLgjqoeHrZsABj0DbRa05EC43Kjkl0gcKJJTTjxWny94wafipKAaupEJc20E2m8bi4Xyh+lifs6rLeKpF01lIDg/RlRlZ0FqJlGxzPJ5Z718wE2nOIiILH+ETmPT6vqM6AzoB5I5/4tkNYamqS5zKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BHRkZSoJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BHRkZSoJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8377C1F000FF;
	Thu, 17 Sep 2026 22:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789683288;
	bh=MSp2ypqXXj3D7zZ2GgnhtARAVUTIikCeJUnEzXegoFQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BHRkZSoJ9r0oPC4v1xqtuLNKaStzYj5J8GAlv7gBZDLz9aeFsnteqEM6Nnk8KXDas
	 /ZInH1/V8WVqRm2/RaelELdlhk7j8fqHcnPfUH6P0IIJfswMSOEIcQAcI5f8WXboEb
	 9S3Z0LTgHTn+KEZDxUOR6Q6kSQzpLtEiyd06BIJK68ehW2WPAGEPlGEmrG3RycbCgk
	 IlQnVkoAMbYwB/iJtKOH9QIQNx5iDKezfosO4nnghQjBOKde3SzfmuLxi2MkD4se58
	 UH66w4FEfvII2E/ES5Rl9vOIpYB7RfhP+C46N0ScZieERHZfxavgO/B20ou0Tn0StV
	 E/NNEw8Dnmggw==
From: Mark Brown <broonie@kernel.org>
To: Vijendar.Mukunda@amd.com, Seiji Adachi <seiji_adachi@yahoo.co.jp>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <20260917131851.2122144-1-seiji_adachi@yahoo.co.jp>
References: <20260917131851.2122144-1-seiji_adachi@yahoo.co.jp>
Subject: Re: [PATCH] ASoC: amd: yc: Add Lenovo ThinkPad E16 Gen 2 (21JN) to
 quirks
Message-Id: <178967298267.285745.10034745820609778188.b4-ty@b4>
Date: Thu, 17 Sep 2026 20:23:02 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1140; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ba+kuQU3AOx1eiVpm1PJ9aqoQNnMVSYLGwIvL9wLSE4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqrGZU9FLCSv3PZFeThCgPTCPN0hjo7XHdQ7WEf
 sjE2y64jIGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqxmVAAKCRAk1otyXVSH
 0BlnB/9hFb5tjRMTkzIs0ymxaueaJxwC5KP+GHC04nhJtciIJVXu3jat52HPHUmWCSQfTfwN0v9
 8lhGAiKDAm5KHH/YI7X1eV3o7HalxSb8boOjWkDxH+rUpiAygEV3ui8drVUqvtDX11W4kTAO9Hl
 skat1iYLoR45Rs5poWHwPLYxscv//8akfZdWz+j/cjeJc+bYO51n5m2ZsGwvY9xryGy4/zZWmsi
 vVP3ovYErQhzccnchCE9vXUzZ2PJCzqZND/1DJFnw8XL/+qIlhrCANXbedtTl1Z/a1CrFbkKdI4
 6TBKc/AkEc2XyYZbjxWuP6lNZYbjcy82L/Q3STII+A6aGFcV
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 17 Sep 2026 22:18:51 +0900, Seiji Adachi wrote:
> ASoC: amd: yc: Add Lenovo ThinkPad E16 Gen 2 (21JN) to quirks

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: amd: yc: Add Lenovo ThinkPad E16 Gen 2 (21JN) to quirks
      https://git.kernel.org/broonie/sound/c/4cae4ca34992

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

