Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C314D2942A
	for <linux-sound@vger.kernel.org>; Mon,  6 May 2024 07:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714982077; cv=none; b=Nh8BvbfkyYUOa1ZQuN/BMJ4wx77senRu+nI64XDOgX5OuAv+ruOjIeaoRyaLAash3TYplyavFqgoygKweE0pMdrKb25WzFxrMk5Cc68kYdLfihu+6MKFN6XjbnRBtW/aArcoBE+uARBFeu/B72QSgLRPtRbEvVebzGdisr8PyHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714982077; c=relaxed/simple;
	bh=ZHldMi+XR5zOl3Nj2R4xBkvfjPjjz18cENRxNKylRQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ISsNqp6KWyieO5hMBRj16Vpb4ddQdWEZIfv3URmDk9y/W0Nf3DTFTHQWisp+lQBbwQmjE6GdW44kDnr58eJGFdI6VGaQy5oGYYUnqcAAFpcPHCE723CuphYkJc37/3Kxl/vt4sIGkc/qtBoQDjZMShmFufO1YeCyI/foNC/v9Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=XTg0mGta; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="XTg0mGta"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 982BF43F5;
	Mon,  6 May 2024 09:54:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 982BF43F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1714982070; bh=FfaWgzpdSWU/5zJSB0jPdg4i6oCnWwGE7LBN5dTnST8=;
	h=From:To:Cc:Subject:Date:From;
	b=XTg0mGta513dkeCu69DPwBmoVLEEF/UpJ8RfohKUNcHuc1inpgFyC1vKTcZKQecw7
	 9Mdq191VA/aDxch3my2GyxirOng0rwyNHnG6Yyaw5Ws+S63O9Grb5dP70UovcULaSM
	 uZgO619px5UgVl27yN7zQRmJqXG3/CoYhb9kKb8I=
Received: from p1gen4.perex-int.cz (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon,  6 May 2024 09:54:25 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To:  <linux-sound@vger.kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	John Hubbard <jhubbard@nvidia.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] selftests/alsa: make dump_config_tree() as void function
Date: Mon,  6 May 2024 09:54:19 +0200
Message-ID: <20240506075419.301780-1-perex@perex.cz>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dump_config_tree() is declared to return an int, but the compiler cannot
prove that it always returns any value at all. This leads to a clang
warning, when building via:

    make LLVM=1 -C tools/testing/selftests

Suggested-by: John Hubbard <jhubbard@nvidia.com>
Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 tools/testing/selftests/alsa/conf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/alsa/conf.c b/tools/testing/selftests/alsa/conf.c
index 89e3656a042d..e2b3a5810f47 100644
--- a/tools/testing/selftests/alsa/conf.c
+++ b/tools/testing/selftests/alsa/conf.c
@@ -105,7 +105,7 @@ static struct card_cfg_data *conf_data_by_card(int card, bool msg)
 	return NULL;
 }
 
-static int dump_config_tree(snd_config_t *top)
+static void dump_config_tree(snd_config_t *top)
 {
 	snd_output_t *out;
 	int err;
-- 
2.43.0

