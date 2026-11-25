Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697323;
	b=hhzdOcmNuIKaQaC4Rv1AN57aDYNHdba22gkQtcTEbFHss4eo8Kh4hDq0DBwHBptETaVI
	 ycZWcAZZNAccTX/S/ScRtW4ohUBtGw5etq2aQBG+9kC96JmoBQBpuHIU/LFCQz/VeCSx4
	 JVAzPp+4WmJe5Xkx1HAOtJkAFYbAMzsarGCdfxSrcBsqN6GZS1zl0gwxkkd2gBqg59Un3
	 itu6p34chMlmNZ2vnzjhVCMr66bZ4wZfETWpnpVB0SP0Qcw8jLUFhDpMWrvyRBU/ljmre
	 8I6dF0cuPColNJ90Xw4YxBvEi1Uhc3Bsl6/HNoP+NRPMQcdJG7sM2S8k+Oa4mN7rnZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697323;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=V0Qt/1wq2lpyzZ5XcTgtGLrtqNtwsdu5IQAqrP/1W3g=;
	b=emQzDpqyT+6ZoF6RWG4zgKBP6DaXD694ZSSCTUCGBOcaEhAzo+H15sgaqhwp48mHzypB
	 O69LEZB8x6P/gvkjARls9dcNCBWSc4OvMXz5NGkojcQ92J2fdq/Vq9w+CoBY+bsGpLSjN
	 ZHfCeBenXQUqdqiBzKj+Fpz5hcdLsDmXZs0KZAlE84Q80UwlIZ/VT2pWC2CZ6ClSB37xF
	 G/KRm0BwnBgV4R4/i7YgaYGlcFIgPIAzv5wiWymI6+A4Nfw/xeVwWWSe/EK2tHJG6i7KR
	 g1FByKaklZHqJ5bB/0jAObTY6REJp0WIAuVzKY+Ixenvhui57Z/IX4eQrLKKnaWQ4hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HM4Fn2KL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F911606A31C
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 12:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HM4Fn2KL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41E751F000C0;
	Thu, 26 Nov 2026 12:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795697322;
	bh=V0Qt/1wq2lpyzZ5XcTgtGLrtqNtwsdu5IQAqrP/1W3g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=HM4Fn2KL8PuiP0H/CbRtW+f2Q2lbGgWJXLR/lI/Q8hnMvKs2XjKWuH2LMCzRo3JC0
	 cNmEXvRAnyybocdpblSp6PmrhAJ/Uw7nYxFLAyt8+GDk8UGO/poBwk/a4IcyvVro+5
	 73OIfbf+jma782G7XuKvR51eaPuGQXDY3aozRgIduF+QilspKtk1tWAwQT+pVH3xJH
	 sBP5tbv0cvzSQjIdGVhjgmoJ744FOV5cOmWy9pPBDFvvfAGOa96c7KqluAWBZCZwyP
	 2+KNPDQQ2mZWtiittOCI1vjaqC4ZpnB17bKKyt20tBCWYnvNTUTRuJdA0DjasVqCmv
	 368qyUJocX3Gg==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>
In-Reply-To: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v3 00/27] ASoC: add new Component functions
Message-Id: <179562969586.358726.14774207437307201002.b4-ty@b4>
Date: Wed, 25 Nov 2026 18:01:35 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4720; i=broonie@kernel.org;
 h=from:subject:message-id; bh=sdj/L+i6FBnhqMZ4lFHDoSTUYfiCgDNndsyfjbG6prE=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI5tFY4aB55xtj2f2nBJUX/Y5s6HffMfyu/as7al3nCh
 7r6b/XwdpSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAiN04z/BXZKn3JQDeq+NmH
 aktOi/1d0Rlps0+9TeEQuXTY7dbFrUEM/7Q2T7ysk8N72yT8wO//O/Y8ylKf1CvG2JqjFxA3NUW
 hhhsA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 25 Nov 2026 01:41:31 +0000, Kuninori Morimoto wrote:
> ASoC: add new Component functions
> 
> 
> Hi Mark
> 
> This is v3 patch-set
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[01/27] ASoC: soc-generic-dmaengine-pcm: move devm_snd_dmaengine_pcm_register()
        https://git.kernel.org/broonie/sound/c/d680ba51f7f8
[02/27] ASoC: soc-component: rename snd_soc_component_{init/exit}_regmap() to snd_soc_component_regmap_{init/exit}()
        https://git.kernel.org/broonie/sound/c/be3f338873c6
[03/27] ASoC: soc-component: rename snd_soc_component_regmap_val_bytes()
        https://git.kernel.org/broonie/sound/c/9c5d61abec9e
[04/27] ASoC: soc-component: rename snd_soc_component_regmap_cache_sync()
        https://git.kernel.org/broonie/sound/c/55a3e787200a
[05/27] ASoC: soc-component: align snd_soc_component_{regmap/regcache}_xxx() functions
        https://git.kernel.org/broonie/sound/c/a8eb1d812d0e
[06/27] ASoC: soc-core: move snd_soc_del_component_unlocked()
        https://git.kernel.org/broonie/sound/c/1ca1caef5b1e
[07/27] ASoC: soc-core: add missing snd_soc_component_unregister()
        https://git.kernel.org/broonie/sound/c/880393bc2bfd
[08/27] ASoC: soc-generic-dmaengine-pcm: use snd_soc_component_unregister()
        https://git.kernel.org/broonie/sound/c/7c3533508433
[09/27] ASoC: soc-devres: use snd_soc_component_unregister() for devm_snd_soc_register_component()
        https://git.kernel.org/broonie/sound/c/2408a5eed7ec
[10/27] ASoC: soc-core: remove snd_soc_unregister_component_by_driver()
        https://git.kernel.org/broonie/sound/c/bd3b466bd188
[11/27] ASoC: soc-component: move snd_soc_register_[un]component() to soc-component.c
        https://git.kernel.org/broonie/sound/c/5459e6d238e5
[12/27] ASoC: soc-component: move devm_snd_soc_component_register()
        https://git.kernel.org/broonie/sound/c/8a21879a0a3f
[13/27] ASoC: soc-component: move snd_soc_of_xlate_dai_name() to soc-component.c
        https://git.kernel.org/broonie/sound/c/e19d8ca4bc8f
[14/27] ASoC: soc-component: add snd_soc_component_name_prefix()
        https://git.kernel.org/broonie/sound/c/31518c1a6e8f
[15/27] ASoC: soc-component: add snd_soc_component_to_dev()
        https://git.kernel.org/broonie/sound/c/dbb15d439bba
[16/27] ASoC: soc-component: add snd_soc_component_to_driver()
        https://git.kernel.org/broonie/sound/c/8c8dd756b3b4
[17/27] ASoC: soc-component: add snd_soc_component_to_card()
        https://git.kernel.org/broonie/sound/c/5a6f9f229329
[18/27] ASoC: soc-component: add snd_soc_component_to_debugfs_root()
        https://git.kernel.org/broonie/sound/c/b461f4daf684
[19/27] ASoC: soc-component: add snd_soc_component_to_regmap()
        https://git.kernel.org/broonie/sound/c/2349773f2add
[20/27] ASoC: soc-component: add snd_soc_component_regcache_mark_dirty()
        https://git.kernel.org/broonie/sound/c/17adf820d64c
[21/27] ASoC: soc-component: add snd_soc_component_regcache_cache_only()
        https://git.kernel.org/broonie/sound/c/b3d85c7a63dc
[22/27] ASoC: soc-component: add snd_soc_component_regcache_cache_bypass()
        https://git.kernel.org/broonie/sound/c/da50009144e2
[23/27] ASoC: soc-component: add snd_soc_component_regmap_multi_reg_write_bypassed()
        https://git.kernel.org/broonie/sound/c/ae261152c4d5
[24/27] ASoC: soc-component: add snd_soc_component_num_dai()
        https://git.kernel.org/broonie/sound/c/3e30b0232bd4
[25/27] ASoC: soc-component: add snd_soc_component_connect_dai()
        https://git.kernel.org/broonie/sound/c/cd7f386dc8de
[26/27] ASoC: soc-component: add snd_soc_component_active_update()
        https://git.kernel.org/broonie/sound/c/09cae9addf15
[27/27] ASoC: soc-component: add snd_soc_component_device_link_{add/del}()
        https://git.kernel.org/broonie/sound/c/e14a9bcd22a7

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

