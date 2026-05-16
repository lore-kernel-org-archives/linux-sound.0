Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671B62D061D;
	Sat, 16 May 2026 04:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778904771; cv=none; b=YLBZitUNVnCmt/2voSjcJZnQ2SL6h0+w5hF3ZYh1IKYt6PQnRksGdyxpftCm1EvG4bNcy6WvPs6EujQBDlt+2hyT0G6BQbsWNDEhp2KOQfjpzEAslTaOWRw5u0q/zl3tMJgHE8pBGqmGmvczJHxrEzMUiqEkqGlMFZVu/5tDoL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778904771; c=relaxed/simple;
	bh=phWCXV0dBEQHQviaWYpuUPx6Jj/IPGm2F1w2+xzPxqw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=D0d9GnJalyUXr/gp8UP9MX8Tz8ZQDL1KoS/V3eB6GxCPFSor6cO7syq6t2BQJIBAv9lLMb4CVnOQAkWILnOMUzh2cCDcu8h4EGyYVW81kJ/H9EoxNNRU8uw2ZMhEi5iasNj+5cByEsA+bA2a2BRnAgT7K2kuRaMyYmD214MHqT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a87OCMB4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a87OCMB4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A57C19425;
	Sat, 16 May 2026 04:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778904771;
	bh=phWCXV0dBEQHQviaWYpuUPx6Jj/IPGm2F1w2+xzPxqw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=a87OCMB4q25e5rGodyV9Vd1cneTdC5ljv+YLjDqLpLendU2mEwonOmXtwer+7DXrb
	 iCtf5EUA59b4RuhpcDVcIsUxlTOqgmsJ6CYIpDrf0iEIsIbf8hjC8EbpvVtNcKc0iF
	 lcXGnHahmjHeD1B/5ZopVyDXDfdblc3JrjwNtdZEmPXCW/WDLZE/c952Z5ZrHp0Giu
	 M5+Qioem2uq3yPfpFHEgJUOTnGTB8ZJFm8wo2sxMSPErZqmNGPGJC+UBmSj8OTaAHE
	 BMhF0LVjzDh0xeGiaX/J1t3QPVbtxu/QNReuAwYhqoPz7onBoilu3hKIMqK/FWv3ne
	 t0XRYPlUxd8Sw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: jens.glathe@oldschoolsolutions.biz, linux-sound@vger.kernel.org, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org, 
 dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 val@packett.cool, mailingradian@gmail.com, Stable@vger.kernel.org
In-Reply-To: <20260514090607.2435484-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260514090607.2435484-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH] ASoC: qcom: q6apm-dai: Allocate an extra page for PCM
 buffers
Message-Id: <177889769874.1174745.11916206017896372567.b4-ty@b4>
Date: Sat, 16 May 2026 11:14:58 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147; i=broonie@kernel.org;
 h=from:subject:message-id; bh=phWCXV0dBEQHQviaWYpuUPx6Jj/IPGm2F1w2+xzPxqw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqB+68HEKvV1ekiBeehCcsmqSpy6ea7nHqx4qaS
 HSWMTyuCeOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCagfuvAAKCRAk1otyXVSH
 0IlGB/4+utikhbeeJOLd/w7wRdN+HEybp1esL44kjqJFeLxp3sGeq7RbZNx2Mqzy8htsIqyMMnb
 ptP0/Zf2OsuYVxXvfGKE9f4/8AYWvQrtbQQbfUNENgthILvJnhUkb0phWNFY94hKMlsItbdZdrF
 jCVUB6Gv2DPA06Z57oCe1aUzFK9kQRki47WWClVuvToVLafoPhPiWR4AINt42bLNvuOx4V/TVP5
 uOeh9qjZteqbpMwpoEFLQ/NMH8cET+TtnG30WfCIbe2vJFbMfwUnAhGwapUJN6NGztzP2urc6z9
 B2bLALUGNWDVOnYr5MmmGFZUcONyNyVD2ayeusHNrCzghuuo
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 14 May 2026 09:06:07 +0000, Srinivas Kandagatla wrote:
> ASoC: qcom: q6apm-dai: Allocate an extra page for PCM buffers

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: qcom: q6apm-dai: Allocate an extra page for PCM buffers
      https://git.kernel.org/broonie/sound/c/7e68ba282165

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

