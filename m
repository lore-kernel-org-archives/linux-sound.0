Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205F63537CE
	for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 17:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786470920; cv=none; b=IiSJYvm+CS02pbLAdhF8gDu0GM2eapNITGJazE2eGaA/7YyBGYAPPlFDzbNTXLFxIPvEC81/5ItlK8mcAD+XaXjEoFhsihqg+AYbVLLJ7VsGz1RSjFanIiwXV8PUDZ7/3O4EsgrLDc1cy/zVsoXO9+r/El2FVSIPJMVHQddOosw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786470920; c=relaxed/simple;
	bh=6MtSswunV8kqiCp9Pyi24aQWKCDuiV3E1d2gfWObpQA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SltBJd76VpprZFtEhUXtkb7jxHxoeroznf3aHizLjWQhUBIsuvOxsk1Jrg0C2ixv2/K3UcNmEzACdtnQ0CaVaQP/nKnAK8iU3TJEWNOiaMlI9yPjdQ3H000lEnuIhb64recLlPKKaIWhfhXG5B+Q48X/tlcu1Pk1a5jvN56uea4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NgpdDeVr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NgpdDeVr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBB8B1F000E9;
	Tue, 11 Aug 2026 17:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786470918;
	bh=zEyfcoh/RR5qrJncN8RUKtqdgvb33esyeIVvnvgv4sk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NgpdDeVrvEDCosr3xUBoay+m3M8ECMRMaP6XvLA20/SkpVIdIPQ2mR/ZmE7+AF2UM
	 OeeLcZ7OAQpcbIiDGzuYpq2Ncvzuv9Rt/NxW3TKqHc+zHmqcHRCA0plyDgGzoy/WpS
	 JSTVF0a5cFnOjOQ817lPoUbW7dWJdi+vw8h6x4mmPMa50ocyqwEszjVP4YDGZmvKmY
	 i9Lp/wgGMk2L3WzxzKk6dmHts6h+uYiFjXxlTY83aVViTIVJlcneNsj+QW1VlpVP73
	 h0sewFs1hvqJXGXaOH86nm5c2p7QWdnsARRsoldhBmNnwXRsCodPlw39soF5rYicCm
	 +/2OIeztnAJ4A==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com, 
 peter.ujfalusi@linux.intel.com
In-Reply-To: <20260811005354.2884137-1-yung-chuan.liao@linux.intel.com>
References: <20260811005354.2884137-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: NVL: Add entry for HDMI-In capture
 support to non-I2S codec boards.
Message-Id: <178646517635.119683.9262080073978834349.b4-ty@b4>
Date: Tue, 11 Aug 2026 17:19:36 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1175; i=broonie@kernel.org;
 h=from:subject:message-id; bh=6MtSswunV8kqiCp9Pyi24aQWKCDuiV3E1d2gfWObpQA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqe2IEm0mtWpTKlyjIdD0BONXm5vSaennNahH83
 pU+kLXSelWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCantiBAAKCRAk1otyXVSH
 0DDlCACArStmqQXEcbiGZ7FZqyL78BtM7EwG91mFX7I2ejQA5QkzwpqeitczR88YzMNJL9QEOU+
 X2gGB33In+8HBX1ukQw1nflqLypdsIMVg2+HnQx4haZg3XP4B1a6q4sgijiM0cuZ0dQEmXItmAN
 dWUKFHYkqpgnP6PXs0A1aH20I1GxgjE8yuDtLQvmFg8C+nDFBbQfqRnFma559Z8wK47VN0LqJcf
 BcTwxLFpkXBRhdAhNtHkyDWinUYK7Jw2vZBxAbBeN67p2csML9+2+NaByLV1dS7jji3CjoPHeL0
 Zpt16M3jMkdtrcHwL5CVvhC2kjcLI1a4EhC6ft2bK++omOQ4
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 11 Aug 2026 08:53:54 +0800, Bard Liao wrote:
> ASoC: Intel: NVL: Add entry for HDMI-In capture support to non-I2S codec boards.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: Intel: NVL: Add entry for HDMI-In capture support to non-I2S codec boards.
      https://git.kernel.org/broonie/sound/c/079e27f52b92

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

