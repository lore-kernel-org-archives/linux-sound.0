Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1E02F39B5;
	Tue, 14 Jul 2026 21:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784064283; cv=none; b=mQeJLYt6DEQcpBvfVyqCQBMr3Pl4ChMQ2wRI/0dDHgJbU6lSUYsPJVt/gX2/sl35Ps9KH9OPkludo6WwFbBV5Z2XUyGN3Ma67TCUF/FtFfLfXplAcnp5VPD4Hpdu7DYNhUDGHCQFZQgTjxXvtKN5k028VD4uWontJ0bwpjUz3Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784064283; c=relaxed/simple;
	bh=LIJ80AtCHeLwEzZqib/R0hJtmzcMAuexFfgA5l+yvdk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jbY/9qQzcFBotP/c8YLi9jYp2TMO24FtdInTmvaDNF0Zse//VMJdy28iCiq/ILMkGJMUCHBMyyoh23Idy4aPUfG/U3yVmp1ieKyDhAQ0vR4Y2Ka3NSaYnTXkaH1nS2Omud1LlyJpjgf6joSyBz+yo9cc9vs1+r/qWnYk31x24JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XJbIXL7p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XJbIXL7p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D99EA1F000E9;
	Tue, 14 Jul 2026 21:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784064282;
	bh=eq+7dInl4Hghd1VPQ1DAfZ+ZdaOLBvsOzzjklz4MSlA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XJbIXL7pclW4KUykxyA/43qAbSueDdVSmiAviBX/vD4u8zbC7czPMIBq1lfoPGwZI
	 InPnvw6PmXn0tZH+2qPG6qvnwi4X2N9+13AtAIgqAHvNAoh2GJw8N7n2y17Ct9163C
	 THC/8dC1T5PBeraBnuakZ67tfCYmaCKZXIes/5qMh4gqvvgxcengVXWUV/YfQI1Ytx
	 wxmVRXb1yopE4Ak+QZs71gfoiNJ4VDZrqit/PjjA2o7vSyyLquqBsziz/EQDW81vru
	 ULJQrxRlpZ2quFPkohXjYUaJrAaG2+/S24ZIPxTBp8JRJQYFc0mGPYFTPYiZFS9Mdi
	 ECrIMPq4Q7pIw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Syed Saba Kareem <syed.sabakareem@amd.com>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Sunil-kumar Dommati <Sunil-kumar.Dommati@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 Syed Saba Kareem <Syed.SabaKareem@amd.com>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 "open list:AMD ASoC DRIVERS" <linux-sound@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20260710102926.1633385-1-syed.sabakareem@amd.com>
References: <20260710102926.1633385-1-syed.sabakareem@amd.com>
Subject: Re: [PATCH] ASoC: amd: acp: add ACP70 DMI override for new ASUS
 TUF platforms
Message-Id: <178397058426.7914.10290763523746838086.b4-ty@b4>
Date: Mon, 13 Jul 2026 20:23:04 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152; i=broonie@kernel.org;
 h=from:subject:message-id; bh=LIJ80AtCHeLwEzZqib/R0hJtmzcMAuexFfgA5l+yvdk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqVqkWQ0JVDZPR80AgCsZooE9r2RbXddt+L7OpM
 u7PJVIvgSmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalapFgAKCRAk1otyXVSH
 0NYKB/9+LKn7SdQZ695ihXK/1QXzkreRJl6wXQoEwme8SHGvv/NOwYtUe8A3y1VVFWWCz/oS2MF
 Lfoq6sBGqbPNFD3VLUVrxRrifFwq6S0eEQsJjHi6PtmJs9pP8Uj2AAg/h5x+YN0gDXxqh9KvtKO
 FcGnPDE7DMHu271Mu6fLE4CLgOoNqB/tjzrbR14cVuIED2WzU5Fz6VBCpu432fxeplpO32h7dJA
 RK3l8qRzpWv/noYcLA4oJiyyR2AwN5T2hTpRy/8ly6uZVvxVDJSdbVGSZxovr+SC9K6UkZyjoZZ
 jTfzVsQWLgw0uXvN+x+x41V4ZwuC/HUI0y4yGqGlEH9GyiZ8
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 10 Jul 2026 15:59:19 +0530, Syed Saba Kareem wrote:
> ASoC: amd: acp: add ACP70 DMI override for new ASUS TUF platforms

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: amd: acp: add ACP70 DMI override for new ASUS TUF platforms
      https://git.kernel.org/broonie/sound/c/27d090f3ccd4

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

