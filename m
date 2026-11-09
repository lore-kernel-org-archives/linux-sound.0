Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234177;
	b=YtyqKqBqqr0F2+2IjCIksKDq/clhxbcseetz+zRLVF/cTSU6sdcBLEtWw0Jwx18SNsCB
	 fU27tc1O4/aKq/HVTU3FfGa8saKcupZs35VL9zNuC4R2uOyfL5jb6N39pv15H8KN5PkG2
	 iAAY4ImbcDYcrHnCxUZc14ILqawnT8NnuevHx8mzmB4Ususmp/GaZ5nbsrYA0AtHUQQOc
	 PE+RDQTnvUQOra+36oCyC1LKlli4AokMrZKqEuntLlEeuFJOC+Svx6fkDTFOAxWSq1Hs9
	 ZXo3MbZQFiseZ+E7jvgvUH3AJvZe2NbW0QeJuBbniQ7gkc+Kf2uaQ1lGMDFnnBDk0BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234177;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=LXZyVYfvOX5fQgTE6U4N4a/YnNDFwiEu4zZLmZI7a0E=;
	b=YjJfAoLP2Ww2PhqRbgZBsjmOyeg/S5wXwexSkK36ReIX8dR9qDEk8pvGOhmrxeSVkQ2D
	 ATKxy8IacbwqWD4MRX9Bz3ThPFu5KaNXNwKcqhDlmc6DjpF8H5tsX+cJQrW35Mx7XGNmu
	 zw3rbIIWL6scfsqqGFdFCDHmIYn4UFHYm3xk4h8X7EQ167rxm/M506GyO/nIul7rjhk7h
	 z/BU5VU362wE0Wj+31sN7pKJhYqmACRY8jYiXsDNH63i5srOtySSI/E3bThGb38Qp+dhM
	 rk1hjmoYb2VO8cTM4gSE9toKb96leuA2j5PZgwuSABMdiHlb+qXituoRjfNfecy90TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hDHyWOB2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDC6606D805
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 14:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hDHyWOB2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC3181F0089F;
	Mon,  9 Nov 2026 14:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794234176;
	bh=LXZyVYfvOX5fQgTE6U4N4a/YnNDFwiEu4zZLmZI7a0E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hDHyWOB2IfcMfzzisu0rGPXeScK7AGirXEPX4Rd0o7yVGYOZ2EFn0df1q5k4Ux6SH
	 sCwmSPO7BWN9IP4q5/ryHWfkWHXaJ3RflzCyk4hPH9mUgcnMX7JV4XOSGruan4bzVw
	 0nq34c5MYvitX+kD56Q5yNijvvtLzm+loB0TPqNMYM0i7eiB4aT3yUH1FWTNJO8DiG
	 S4OdicOzG/FARCRz/t5zDxmkt9zeZex82cTXNh3ZAEMK8RrbaqWzAwXlbxTvTWgBiO
	 wjbxPrIfoTT778IBwSDiIKhGsqUpix4Kr7MTJ56zQ6r8p/GxazDb4Hu1ds+VZaKOuM
	 4RgSqddxRjy8Q==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 7C8532E9F6E0;
	Mon, 09 Nov 2026 14:22:53 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Olivier Louvignes <olivier@mgcrea.io>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20261106214230.17417-1-olivier@mgcrea.io>
References: <20261106214230.17417-1-olivier@mgcrea.io>
Subject: Re: [PATCH v3] ASoC: cs43130: Power the playback path down when
 the stream closes
Message-Id: <179422630696.3711751.10645916380362854314.b4-ty@b4>
Date: Mon, 09 Nov 2026 12:11:46 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1155; i=broonie@kernel.org;
 h=from:subject:message-id; bh=m3IZ8Fsn+BR7gJEIUsfc9I8P8LgGV7kp8nZ8BbeSYkE=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+XreVae/as3pWzrKeiM3nPnHu52M+/vHo2uSwF/lTq
 ngf9P9Y1lHKwiDGxSArpsgSl8X9sr7k9Rq+gwvbYOawMoEMYeDiFICJRM9h+Kc2+fADk/o3Cz/L
 r6hZcj7b88j05pDAkgcRvJodeofDtY4y/OFY1f3YMc1KQCJolUStYoxdwYqNZ2qkPnrevsH9b0N
 KMisA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 06 Nov 2026 22:42:30 +0100, Olivier Louvignes wrote:
> ASoC: cs43130: Power the playback path down when the stream closes

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: cs43130: Power the playback path down when the stream closes
      https://git.kernel.org/broonie/sound/c/ef53f23c065d

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

