Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D82B3F9F2B;
	Thu,  9 Jul 2026 12:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783599568; cv=none; b=HgncS6Eo7DufxQ5HPRBggxifiJWV+JhA4MTMxlbu45Az80SumOj3z/iSvhNMmUrtFyBXPzs/NQbji70+7HaLPtz+D50S94AfGGnWoBXOODgOiHJn+c+750bmd2vni5d1m4Hrd03TJQwJnmuN4vNsrjN/n0Baorc085nxhAhjX04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783599568; c=relaxed/simple;
	bh=oNVyHkyuc+qzmwg74P1NlZ6HrbBBimz3SHzs2hSw2fc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GXZJS7WIk9sV/Xn4NXlElgzbXVAnl3kPPam39f0Nr40MjweTcdVcd90qNKzdCQPZL/wK2GW8rU7d5S9Uoxqvladu0KoiqJnWSlddf6/pUXPFrgnRTayL5LQawtKA7lrf+37cjVJ8leroYQMvrlnkc9+gJfqX9ncCS4N9vg8o3ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rf708jzw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rf708jzw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5F961F000E9;
	Thu,  9 Jul 2026 12:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783599566;
	bh=sx1Kn9UI8jDdmV5M1hgudJKzSjmZpTAyQLIivbqlv+Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Rf708jzwF0unUmLu6z6w3dD4MmMMWau7AmWTMcvZ/NbHfAMz0vXWPuZtiug76EcZs
	 Of/A9TssIdjpM12ose6mnw86/M3WyOIotSszfS6I0GyM+zExZTu29KCRyud9s6twst
	 1xa9Rx/ierH6F08qx818ZlGyIBp6+Edx8Mih0sjwun4XklizjiConFPO0NSdualyDg
	 OlfzTUBouLQ1fzyNsidPwmw/yF1+4OQebkqkuWy+3B4oNOvMrn4BOcYEUM6/eaGQHE
	 nuh4M4t1cBkfbpxHdy6CF1xoPinETgb9d+irb51U0gDnRtJL+YemBpfidSOyxVTgdf
	 0vIUhSXY35IcA==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20260708103430.1395207-1-ckeepax@opensource.cirrus.com>
References: <20260708103430.1395207-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs42l43: Correct report for forced microphone
 jack
Message-Id: <178352755468.26140.8491218335151951398.b4-ty@b4>
Date: Wed, 08 Jul 2026 17:19:14 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=broonie@kernel.org;
 h=from:subject:message-id; bh=oNVyHkyuc+qzmwg74P1NlZ6HrbBBimz3SHzs2hSw2fc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqT5HMS9/8SghFlCEziuo6LUxknh5c7hG5FW/MT
 Pb8aesfX8yJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCak+RzAAKCRAk1otyXVSH
 0FfyB/9lmMpAbtfl3MEJfUTMAw8JFnsx6s1NytQeNZvsjYWmc8+tY+LJKvbkQvUq5Mi5wNF6S6/
 ZrKoE5ZvY8edo8KNq9si+ms/0Ekf0lGZs3NHeAcuyqpKvfEEd1/4Imv0Uowx5jf/6Sb2vA7MzzC
 t1gpb8qLTedMEJ5epORy9qFzzEbO3k3PMVsfhzY5IB8OeLVFhaaBE87Kf3n3wx3nX1aX8PBFOGF
 PInFBxEZIeuvBldIGo/0N/8fLgnkVxOuxIQMOFNLFqQLjSrTykIFArPGG8Iqkek6N4seDXgluvn
 p2jUvragf6bVhPiE8s2NOrDDPTzjVx5bv771W3QS4jz+jSYP
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 08 Jul 2026 11:34:30 +0100, Charles Keepax wrote:
> ASoC: cs42l43: Correct report for forced microphone jack

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: cs42l43: Correct report for forced microphone jack
      https://git.kernel.org/broonie/sound/c/f74e6e15485b

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

