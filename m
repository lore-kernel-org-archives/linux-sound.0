Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B58C372055;
	Wed, 13 May 2026 01:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778636361; cv=none; b=UuKPq2WBo6P3punIPRuwc3zGt0bI59aNrvGvFo+etFuKpJwF3BtScwRGT19kLt542QhpxgX3/P0Gx1BvLfV9KJDsu/nr9HNyN1wockBc4HT43m1x99ARdpeEpFeeHyhk8uEmSIYpZo2GrX7qiDcGXMYD4C5KP0iw4P/7ciXZL68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778636361; c=relaxed/simple;
	bh=CB88IaZ5nDU6ijoAUtQulND+zTjbOShxB81jnlOHZd0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=D6GIlqTaIYnbEwsJardTpJA/YqcnRJxY/g2D+lWHQbVoTe3eS9ATH/rBz487tcMMRYImTkYOwCzsEPfJJQ3WxsgTqfDLT1qFNQj/VYF0RaXg8Wj6aGWSFC/Xx1sBwoqgh8XnuUEB4XULYLUcj/JrldLJ6cOjmwTSi82C7IEV650=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JJw9N1de; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JJw9N1de"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D290CC2BCB0;
	Wed, 13 May 2026 01:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778636360;
	bh=CB88IaZ5nDU6ijoAUtQulND+zTjbOShxB81jnlOHZd0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JJw9N1demFeM/8N4odilCUtGAX0K9F6HHRkNne021T9BRSIZ7syxsE0HlNp1+nrlH
	 q6bjFBDJSoUEtFbecHEaniQCiVWKj/Eg8mfvFU3iyNaCJ9YzhGGw2K7261fsCtggST
	 ldcNcBbQzoP8AMxRXt9/eqVkyZyxVIvF2IqEjPucXZDnnHvoJYmBgDuMslJMz2fXyU
	 0JdzF7uKtnRTmIuCRpNeNtoUxvG3VXeHKa0tll1UfTTyp5weNUdf2Dh3jbwNMafA8S
	 0znh7VyqJf6hVi4WQ4jmAEcO36v21PaF5T0FlDJHrwnMWqW5N/RAChtSWVAz0Lf4zk
	 BXwJWqyQMcRgw==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260512123126.260148-1-rf@opensource.cirrus.com>
References: <20260512123126.260148-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Abort TDM mask loop at maximum channel
 shift
Message-Id: <177859210011.1043532.10479051781995429609.b4-ty@b4>
Date: Tue, 12 May 2026 22:21:40 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142; i=broonie@kernel.org;
 h=from:subject:message-id; bh=CB88IaZ5nDU6ijoAUtQulND+zTjbOShxB81jnlOHZd0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqA9ZG6Y9NWFcUclw/7XNSzu4P+3BHrvDcshcul
 w2pucaDGqyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCagPWRgAKCRAk1otyXVSH
 0LKuB/9sO+jN02o8WhCdsHzE5rBPYoNyriIQqYL/LGD3RX/JIJ/Y7c9wl0Q/KFvCKP3uI4w9kmd
 5+BI9uUvTMnUwbBU10qxPHESsawR6vRt1hg2yUg/etFRlkrKdVemFv8kKBvq3Xxcz7w/8syhXxD
 57CU8zAWSYcNs4RBQw81GJtQ+uHmTZ2QgofbWvjvNEyxm9YOZUKHV71P8Aac6Dpp7JXINQV5ac/
 25KCkAAZgpFjZSZe+9M27496vxtIzDMa1IqxxwgHBeowEBMY/dqm6hl6KwooFrxDOMft2l2a0rP
 yCfhe8xUuVbVD7aVnZc8c/vbu9/wRCyA2f4dUcFfWeTTcciE
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 12 May 2026 13:31:26 +0100, Richard Fitzgerald wrote:
> ASoC: cs35l56: Abort TDM mask loop at maximum channel shift

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: cs35l56: Abort TDM mask loop at maximum channel shift
      https://git.kernel.org/broonie/sound/c/7d572b75d54e

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

