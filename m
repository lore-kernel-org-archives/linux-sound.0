Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96973B42ED;
	Wed, 29 Jul 2026 19:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785353905; cv=none; b=NRE7gxxr/gW9meuNmrWWiqdXxeLGqIwo68gFhEuCmuk/zEZTgDzbmBJnMu/7nfXmIpIfOQyzg8ry2PQcTHbLjee8bwmp8dZVPOmmb2wmq27zcMTWQNYTn+YEa+aVgXMw0kWeuCiJ6nDV6tJpm4nw9XGEQfGPwpjr0n7LhPNAPN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785353905; c=relaxed/simple;
	bh=jsMXZT4gccjDa/7ErbHIlfifUX0YqbHsZ0/8RwqBSAE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nw0rYlxtbmXwVZMk3zcHLpbYIXem3GrGPV0y8zWufv6r/ZT3s4+IDUXNmwWMXYee7u0q3c+PSZtMulSL/3iSsYTtIcIgh6YXsfkn5He4G/jgtZtPUIuTkICNLuSdTEHIa1UmOr51crTmCD0b/ecOnMG4Rece8VV7QSUjS0mEO4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PxhY7EPr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PxhY7EPr"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73662C2BCB3;
	Wed, 29 Jul 2026 19:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785353904;
	bh=jsMXZT4gccjDa/7ErbHIlfifUX0YqbHsZ0/8RwqBSAE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=PxhY7EPrjFYEpumf/3suYOG0yVwTp1MzlOOVpIwOvnueoib/qwXWzdSz8zuzXbgV4
	 g2pTM3PG4q8JpOwdzwnRq7+/T6UZ+6V6pd5//iCKafJsRK8B26uv7uS8cccXzU+5ph
	 Z3qKEjdSZMaVuA62eEHDvajztD+MXYrj+Nz1rMqAqKRuHGsA58gNMXitMUTyL0GGN5
	 KV2ekgWrv2fr/4XW2Gb/ilrStTuZJqNvVXdLmjOP2reoqn4ztIRPEKx2Cm1mAlCZzU
	 238gdKM5RxcsHhfokVFxpoDMbB2sfxZjy/YjEBnZvoyICsf1z2vxwiu1qlMSCM71hA
	 +98su9d47Hqzw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC45C53200;
	Wed, 29 Jul 2026 19:38:24 +0000 (UTC)
From: =?utf-8?q?Dawid_Wro=CC=81bel_via_B4_Relay?= <devnull+me.dawidwrobel.com@kernel.org>
Subject: [PATCH 0/2] ASoC: codecs: lpass-{tx,wsa}-macro: fix enum kcontrol
 accesses
Date: Wed, 29 Jul 2026 21:38:11 +0200
Message-Id: <20260729-worktree-lpass-tx-macro-enum-fix-v1-0-0cf02c681332@dawidwrobel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NwQqDMBAFf0X27IINqNhfKR5i+tIu1kR2bSuI/
 97Q48xh5iCDCoyu1UGKj5jkVOBSVxSePj3Aci9MrnFd07uBv1nnTQF+rd6Mt50XHzQz0nvhKDu
 HNk4+Ivbt1FHJrIqi/4vbeJ4/K1E/ynIAAAA=
X-Change-ID: 20260729-worktree-lpass-tx-macro-enum-fix-c5fbafef75b6
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Dawid_Wro=CC=81bel?= <me@dawidwrobel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1083; i=me@dawidwrobel.com;
 h=from:subject:message-id;
 bh=jsMXZT4gccjDa/7ErbHIlfifUX0YqbHsZ0/8RwqBSAE=;
 b=owGbwMvMwCV2qrTGfeXVd28ZT6slMWRlha1nS6p4uetNRXn3lj2mLXef7f3AlXv6pFaZpWH8M
 mmhZZKNHaUsDGJcDLJiiix6aUF7rIJffn/34nc4zBxWJpAhDFycAjCRXRsZGbrKl8v6bXn1av25
 /67Xrkit/Fsp9C+L9/GluJhjezyfxLxjZLi09bby5c8yP+ZtUpE+OmX7tdsfV61ZmMf868V9RQ+
 Vn7XsAA==
X-Developer-Key: i=me@dawidwrobel.com; a=openpgp;
 fpr=B64A778E0E64049A70C831C8B7B81FA12B282A92
X-Endpoint-Received: by B4 Relay for me@dawidwrobel.com/default with
 auth_id=901
X-Original-From: =?utf-8?q?Dawid_Wro=CC=81bel?= <me@dawidwrobel.com>
Reply-To: me@dawidwrobel.com

Both drivers access enumerated controls through value.integer.value[0]
instead of value.enumerated.item[0]. The same bug was fixed in rx-macro
and va-macro in 2022 (bcfe5f76cc40, 0ea5eff7c606); tx-macro and
wsa-macro were missed.

On 64-bit kernels with CONFIG_SND_CTL_DEBUG this trips the elem value
sanity check, and every read of the affected controls fails with
-EINVAL.

Reproduced and fixed on a Xiaomi Mi Pad 5 Pro (SM8250) for tx-macro.
wsa-macro is compile-tested only — that codec is not instantiated on
this hardware.

Signed-off-by: Dawid Wróbel <me@dawidwrobel.com>
---
Dawid Wróbel (2):
      ASoC: codecs: lpass-tx-macro: Fix enum kcontrol accesses
      ASoC: codecs: lpass-wsa-macro: Fix enum kcontrol accesses

 sound/soc/codecs/lpass-tx-macro.c  | 4 ++--
 sound/soc/codecs/lpass-wsa-macro.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
---
base-commit: 57b8e2d666a31fa201432d58f5fe3469a0dd83ba
change-id: 20260729-worktree-lpass-tx-macro-enum-fix-c5fbafef75b6

Best regards,
-- 
Dawid Wróbel <me@dawidwrobel.com>


