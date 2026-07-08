Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04123BBFA3;
	Thu,  9 Jul 2026 12:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783599528; cv=none; b=tF0dEbYGQjP7R+H8OA5sPilhzFhU456D+iSsxLoNETBOCarhz8e1qQSjnpurOSs2nzxBEPdAu54n/KTq8U9ZqBWPaMiPxACThqzlSV56ud1Aso/Vl0bJDSMM1JIMq/8e0cdi2SKA529O3Wbuz2aoeMHwtP0+v/2m1DXdAM0jA98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783599528; c=relaxed/simple;
	bh=TETYuwy/gPzHLTqaG5EGFXkkOhb4aBVuwMJz8UCxp6g=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kLM6OghNy1d3m2F+FD4iKb1Y8PkYgzZ/emAzCRDvszX5X9gXhXOZTxk572ranuDEf1yCcf3GHyc5ORq2PwOy7S9JY04ZqFz3LzKbZGnFDCMakhpzVx9f376du7euGlEyDZPvB0p6UPYd5bA2eDDHxPWk1kFvMhsEkOZ5+d8U6gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hIveF2fJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hIveF2fJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E91871F000E9;
	Thu,  9 Jul 2026 12:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783599526;
	bh=D/E90WDy7bym/5YDFeqIZeY3nnPXPst2Z3zsS0jc9+g=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=hIveF2fJUD4TjIylK81MFkyvSXGS+5nfTZnBx9gqGr9gVNonUmr7G2tPaYDvmc5hk
	 DC7xWrYolN7aqZQKU6XZrj0lpsh3QrZLxaWyr+cnrLOT0KUiJ/s06sAME4JymltNNK
	 paNRKksDIFz1lGjZJ97iXAdwu39g/m/Byy6Vx+cFc1y1TL6C8PxdUB/P4iDeabvA8R
	 zc3eXXY0NxVzcOuV8/5POavjbzee1pJOrflHMNLALDG2uDvBc1+r6c4tNQMXcs9jLk
	 4/0LBRXl8gZuvXknW0t3Z3QnW/yhixevULWSg4m+88kxr0uP6rDpytThTM9Idbm7ZP
	 XEALMQs2QlYPg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Pengpeng Hou <pengpeng@iscas.ac.cn>
In-Reply-To: <20260704074044.45520-1-pengpeng@iscas.ac.cn>
References: <20260704074044.45520-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: codecs: max98373-sdw: Propagate regcache_sync()
 errors
Message-Id: <178353546674.26140.1427053297161439795.b4-ty@b4>
Date: Wed, 08 Jul 2026 19:31:06 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1138; i=broonie@kernel.org;
 h=from:subject:message-id; bh=TETYuwy/gPzHLTqaG5EGFXkkOhb4aBVuwMJz8UCxp6g=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqT5Gj6UKHHgfmmEvX0DKpwkKIIE6GgSY5qrWvh
 2uSM06RfTKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCak+RowAKCRAk1otyXVSH
 0HAZB/9I4FEY9nRNshF/TcVC7B6zLiaqpRnYo32Vq6BHiBJm5oWwoDZ/Xml/beHrsi5xhf9XWtR
 Ej1JvhbPE3W3C1piHw35qAKbJqhG7gEB7rBYwACEL7s04NwwbzD2zdpYCcOMZfHgibaC1A7ZNTi
 q07cF+e0WER09crWXeHe73QsrFKgAPp0tHK4R9+5E6gmMYb4eN7+uL55MUO99KWkORU/+sYXudT
 PMSI2DWqrjUdqCD+9/2mu+qJUVr5k1A8D3ew41AFyCjQBRsP6l4JsydjGVzOkecervjxJTrnLuD
 tbEeUoPC+s8v6R9SHwQUd9HX7lemeTTIkJyp2guFZn8QuwQU
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 04 Jul 2026 15:40:44 +0800, Pengpeng Hou wrote:
> ASoC: codecs: max98373-sdw: Propagate regcache_sync() errors

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: codecs: max98373-sdw: Propagate regcache_sync() errors
      https://git.kernel.org/broonie/sound/c/b64317ec0074

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

