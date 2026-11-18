Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110741;
	b=rsRdEpMpdb87b5lyZr1D+x1USWtNA3/0+p8hSQ62iBvhaTfJnbJjaB8rmjN4kXBoNSCG
	 0fwmSbpzfRRCXi5s2AeJ1aQRIgJmBWVZsKaZdm4w1aTSttS3ccEkK0JHd1QW0z0CvvMKf
	 kD1myaAgp0o/7JnjXzuYBQ25NmU/gRQSuIQNXqcBPsPyeXRrbkF1TsglrAsgPxLGSaR7P
	 O+9CGEbQHvANc/gns9U9Q0id9vjg0TanFs+JNSL7bs8DibxRgTgieCTLyLQKQvEzRD3c7
	 yIm+stk3MZb8LrYbrnfO8t4OxpCgMbCXNXOZBCpHjfWQ3dnUB5Asf7nOkOoy4c67Eow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110741;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Uih1kTZsdqv/qq184U3E3uOq2X5li/Id2xFWDnaBvTw=;
	b=UwrmW7HyykoiMTVTPT9UQ+NHSktXZlXlHTh1SJ093sWTSKlWwi92W2F3NoUFjxW43Hr/
	 lMm9CuSTwUCID7okxK1wejs7E7H9i+Sz3GNVzHHG/ME9AuuGTsP1XAcGPCUJ4WAkEspz2
	 WykJALgQJCcMpGEUaOgw30MBfzD+pcnq+MwWG+OjNM8uHVnQbbnA+0nzyh6Ls7OdOUucE
	 ERXqmoGpYIeFoUvQej7+vmjPF324hfOknVgPkazoZSL7HX03FycnDRDUjhOsonaN6rDAu
	 muPh/XTY9j1wvq2kX3jBsgAVr1zMW3mfOFK3UtejKILbKDnLC/H+VT5VuXizTK+jxKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VvZOp+Q1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D24D606A332;
	Thu, 19 Nov 2026 17:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VvZOp+Q1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 656121F000C4;
	Thu, 19 Nov 2026 17:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795110741;
	bh=Uih1kTZsdqv/qq184U3E3uOq2X5li/Id2xFWDnaBvTw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=VvZOp+Q1w1sD8khUGeFO4ltpkbFuBpdK6O913jswJ4caeDgRdd39fH7WtxoQvaGQm
	 bc71VqXcTpwDT9w2/I3dZWxbNbxnAzHyAGpkznndu3jbJL5RGsyKcw5/ahlvCJLTCR
	 IYLVdCF+ET9mhHu8us47MWb5ouPdQalag8qGT6VHznNhH3yVaqOT6DRJl5Z2rAH1YP
	 ulXEHzEij0v38QeqpW4ItI2J30HmyEG/+pdiv18Jlas9gph1PF9Hm4Pp2vjINxHwcX
	 c1ZqK9ILfgxaN7lzj0skrKDgHV1d92YOrLQmKNc+fRPAr9LB1Pi+qMZd70W8apW0++
	 wxqlksl8mTS6w==
From: Mark Brown <broonie@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Michael Sikora <michael.sikora@axis.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@axis.com
In-Reply-To: <20261116-adau7118-32b-with-coverletter-v1-1-c66b3c70d228@axis.com>
References: <20261116-adau7118-32b-with-coverletter-v1-1-c66b3c70d228@axis.com>
Subject: Re: [PATCH] ASoC: adau7118: Advertise support for S32_LE format
Message-Id: <179502739663.810609.15689096359133872648.b4-ty@b4>
Date: Wed, 18 Nov 2026 18:43:16 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1122; i=broonie@kernel.org;
 h=from:subject:message-id; bh=baK+gI0FoDaEQRPs6SB7xfQLQJFICi/kahTak4hx2Mc=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+mwdef8i+sHatTo3kAT9RjePfezwKNK/qbuWeaHDx5
 6l/Z1bYd5SyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAiv4oZGWYmft5bvaf8xef4
 idbPSqNjVyuz2D3fyCSuP632z7+6rnmMDO/n7r7qz8UdN7Hpje29Q7yr7u/7c9tbV2IWs83tycI
 Lq7gA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 16 Nov 2026 10:24:27 +0100, Michael Sikora wrote:
> ASoC: adau7118: Advertise support for S32_LE format

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: adau7118: Advertise support for S32_LE format
      https://git.kernel.org/broonie/sound/c/1fc09e0c26c8

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

