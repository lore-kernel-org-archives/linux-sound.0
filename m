Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319D73E5ECA;
	Wed, 18 Mar 2026 16:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773850883; cv=none; b=EHI6HpI+inVf2+Po2QusYinrng9QRRndzb5AtbhGS8AGAyHEyNuu4IuVH0SpKBPj9gClcJ400L074686nAj3hU4N1WdSeBv95H/YopXFBM4IxkQS7AmwTsp15pQYVRk7kIhPIr+klu9SyqDoIQ8lCIBki5nLUsNmptCIzqXAN4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773850883; c=relaxed/simple;
	bh=qHa96/Bl0J8gFR6VJ4JxNjHmjJqqYO9KtON6efnlxRc=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Aw4RvRnu29bRdQl+tN+R7RwceoEvmpo8R+Iv7BeyWrSF7th6N0fWPNBtZBaaO1DMUVluVv/cZNmSbfkUFVZ+rgVd8T5uRHZBzHaB47lUYhUsiItJA1gNBXPNuIKaupmMDXDDNj+fqjhtCfDXfWEWW0rd1fPobgkyPMI+w00sju0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k0XLCT6X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k0XLCT6X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90565C19421;
	Wed, 18 Mar 2026 16:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773850882;
	bh=qHa96/Bl0J8gFR6VJ4JxNjHmjJqqYO9KtON6efnlxRc=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=k0XLCT6XeqRNpNajxIOAdBiIi5JNdFj3VRtdS9n4B2XtxBlWzU9r50sqvZJFD+BoQ
	 5C375nhw/lnlfFex1pK8fHplW/gpTzBtOcfIi/kZfM9SS4aOhaLlLe3veEG+BxZTyz
	 QVt8EeHTdkqzmPLthAnIlZ4ifKbB7Udo1qWQ85K/VKqI7XE+crK2FZ8z5l4QCLygFY
	 Cu36bQKqMDzCBlQ3t2Eh4+ttU0yCa2WhuTtbW3wTQsLBI+jgAFf1xzNpfwHUqGdSOQ
	 6YUYWSM56otUR3L8Rim5eGGqw0lXTyaW4JnclyrFdV8BwceQSN4e7FEYu5qUzVm7yx
	 6JUaYnp6qfYUA==
From: Mark Brown <broonie@kernel.org>
To: lars@metafoo.de, nuno.sa@analog.com, lgirdwood@gmail.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Piyush Patle <piyushpatle228@gmail.com>
In-Reply-To: <20260318130733.52477-1-piyushpatle228@gmail.com>
References: <20260318130733.52477-1-piyushpatle228@gmail.com>
Subject: Re: [PATCH v3] ASoC: dt-bindings: adi,ssm2305: Convert to DT
 schema
Message-Id: <177384008813.5804.17077926107736820124.b4-ty@b4>
Date: Wed, 18 Mar 2026 13:21:28 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a9787
X-Developer-Signature: v=1; a=openpgp-sha256; l=1122; i=broonie@kernel.org;
 h=from:subject:message-id; bh=qHa96/Bl0J8gFR6VJ4JxNjHmjJqqYO9KtON6efnlxRc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBputD/xwy4nM1Ekp47is2zyU49W6UI4ahxJBPNq
 Xn0GDcK+LyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCabrQ/wAKCRAk1otyXVSH
 0IKoB/0WBwFpWd+8cen7JlISRTBXtM4Iholuw2uMRWtleEngf4gCw9K3pNLCZrnCrau+7We6YNL
 l5BFImmJE/q8U5EfwF6kMpU7aX4At2F4syhHo+gRgmGv3RBkOUrI9h1UE0zaoRonb6QeXW67du1
 GXJd5C739KgDSxB4Jf5Rk2BzJziCzNBRYp+nEVlDB0HGUkyqlUTxZYGgqPv/56zznc9TABOG8E8
 Szp7wSmKpSK5rZj+Hr97eVaCiIg8XWc4I8+MBBbBL8kEjYmyjzerkRxJmQ0yw1NTo9mErW4eGVS
 DmpQshBCd8JbVVTr7KzYY51cCEkE1zLSBV/QhlzgOi18Sl8/
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 18 Mar 2026 18:37:33 +0530, Piyush Patle wrote:
> ASoC: dt-bindings: adi,ssm2305: Convert to DT schema

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: dt-bindings: adi,ssm2305: Convert to DT schema
      https://git.kernel.org/broonie/sound/c/a809ff6469c5

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

