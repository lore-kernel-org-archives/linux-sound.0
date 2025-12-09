Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC75732E13D
	for <linux-sound@vger.kernel.org>; Tue,  9 Dec 2025 12:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765283973; cv=none; b=Zb5Dp7I+b3PwYAF0j30luRP6lVbLsPoXc3COdm1Yp4T4Zz48eQjGn50tohconUAc98t6od9AqgCnnihapi+pqNOdRLyZrbel2c0qUUjiMB/D68oyTFg58IQUTRXKfHdqqqVDhW7TUoFsbZJW0EXgUyGIO98TIbnfJuT7mT+JQ50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765283973; c=relaxed/simple;
	bh=j2UpVV5A5Ju0ZnRHLsj4VYR8L/xCiTeXzOhY+/e4TnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I/VW6tSxPXERxuPOHRP6JJASMmWSshuKVGBKVb9MrTLdROOloAENJPY1wIFgi5rqOhrTgCw1hLJA5FkBnvEtoUZL8QXi5jN3ppr55Q8yJMGOHDY5GubUGqd2fQGJGW05Ee2uCo++XbGRAw3og94dNZbWgMDfwl2Cvz8aH6ozvyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=iFpRkNzr; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="iFpRkNzr"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b76b5afdf04so887401566b.1
        for <linux-sound@vger.kernel.org>; Tue, 09 Dec 2025 04:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765283970; x=1765888770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pz0AZ8osGS/hAluVwIcKZt8szT+OkIZIfK1R7p75FPI=;
        b=iFpRkNzrCQks9vvlR4Yu5zu43sm7fnOvf3GCmW+m6gGZijVkD5PfGIMvI4sEPpQYSs
         jxK86FQ7wwql10qFrQ6eh4bNIbi919eJ8ng4nFEkJRu1tc8yz3IcllbJk2UIo+cfDBZt
         1rSxNme2Ui8oNNt7YRZMOYQ2nAGGUh3GU5d5FLRzRYn6QwXI3I1o4zHb4eVl1/CrZZyW
         MIFuxpOPjnaZT+nW64vE5Pdlbe2KLqqklLOhLQu18Rm512MREgVgR3hySJFrcdhPijOq
         QhnxP4fDDdwWjxSt5QkJrkmvZZntLQ3upPvy7PCQ5hhShzNzkag3orYDmeGjF/frVoyS
         YMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765283970; x=1765888770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pz0AZ8osGS/hAluVwIcKZt8szT+OkIZIfK1R7p75FPI=;
        b=qorsd3c3mpQAEd+029Sk15hm5WNaTY5REt11jb4LccoYZYoA86QPSMAglQFUrN3rrp
         Vb3y0mAzLBS+nMHUttrVPW70xQex0aXjX3e2wFBgC7Piyybm0fpsUQVannDrXoeKic00
         ZbMcYriw79Zjo/WmPOXfdQ36Hcu2VAggxdrpsjvstinPnNg0ABVXC6dexIILgSqjeVwa
         eJ38uYgJP88uvVRUnq6i+ZBCK/5sA+y/87gHodIMNOyvO9DYQ7u2ditNxIOA52NX9Reu
         iKCx31pFbi3ZgjvXyz8nL0WQg57a836oGtODghvMAqO0OGyREYlZHNBz8Ek12yjfO67Y
         MgGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXErvcLhOdzHMqNfEniXzehouV8GKkOmV/12ZILGJ/uNu3gxOo9W4PEaRrj09enkEMgTrKMw8vkz8p2JA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBLCf4SRgpI6VW6Uo9/txAShrjGkc/wDJyzjJiTgbNCgC+FeBC
	IVtnOM+GBB/qrOfWtlOOhJHfeQbbCqYVgfKi3iR2u0qiEbn19e/PI5A0ugz3aue/IhA=
X-Gm-Gg: ASbGncunOT61tjXDtCyFrqSYZFbLj4ddhM72uT+AAP3iCGiIUzBCt6FvGr/20xZlJG4
	PK+WHjnUzI0M027tJp7AvXgZhAEhW3nwIsiVROaILjLu7aVtWwTbtKkY2uFZ4wIlQBCDl0CK21t
	r+P1hn3A2TF8P6sm8geyLY0R1+hyjVtGpJ2JyOOxZ2x/Y8NL9GtnEfgV5OLkSg7sY3sta7men7S
	aj4fKQr89gZgVP2iAUaEHmRYVSq6+NPPZ6tZxqPK4RR0MZ7i6fz/VYkfbrytzwejbJYdDYzR81N
	Xqij5e0qhgRqssGcb2vofjFbfmjpLA/+dGHu5XfctfoQ9+DvYpXgR6RBO08j+5wvmnm9m8gZWf1
	c2AFb2Avkx+jClLPHTjxHKE32JuBFB4fZOqBwtX28TIfrRlDwy/VpWXLaRCNOimXqXyOXGBw1Uj
	Xg94MR6wimvj4MZqhkJP+9DqEHK4VUYk1TBSPe8xh5ahPk1tyRDNX0bTyKiNCnUgHbKDNmjsjgj
	24=
X-Google-Smtp-Source: AGHT+IGDUi3EsMcieYdBnIhNAT5sGtIjGeltzUF/miy+fnrYV0UBsyghI7sJdkv681Hwn1GNXvZ9XA==
X-Received: by 2002:a17:906:7311:b0:b74:f827:b886 with SMTP id a640c23a62f3a-b7a247f3fcbmr1221841966b.32.1765283970067;
        Tue, 09 Dec 2025 04:39:30 -0800 (PST)
Received: from localhost (p200300f65f00660846b2ba6e435ad603.dip0.t-ipconnect.de. [2003:f6:5f00:6608:46b2:ba6e:435a:d603])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b79f449d181sm1404306466b.26.2025.12.09.04.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 04:39:29 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org
Subject: [PATCH v2 7/9] ALSA: emu10k1: Convert to snd_seq bus probe mechanism
Date: Tue,  9 Dec 2025 13:38:49 +0100
Message-ID:  <31d351fc844348eac0955db8db78c19a0c23d888.1765283601.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765283601.git.u.kleine-koenig@baylibre.com>
References: <cover.1765283601.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1998; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=j2UpVV5A5Ju0ZnRHLsj4VYR8L/xCiTeXzOhY+/e4TnU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpOBhn1CQQGUT3+KfmvIQvMYuZfN8rpQY7/kYHr fHx0TPCSc6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTgYZwAKCRCPgPtYfRL+ TgWPB/9WG2CWxKt3vLljO5FQ3HcBNnUZIJV4fE9vL+pk8KkmxyBw6yIby75V9M19aehPgq2oQ28 JNiiEzWW7Q52Y/JCi7cWz5Sxo1PWCH0dUfSokom0Wuoy81V3Qrj5Czj5A7+KDg1/oCEgDM+XiJf hRuMMMwTYrJ9LHZdg5i9yrmQ2un1PoAaYBSfEmeisHblXm2J6U8B2l7hZH2UkRCctk9vJnyhKzd mB2xW+u5ok5fglUV9pQJkmWwDNDaPK7UvKuJcq23O2vaHgrkPQO0W25HAsq+2jo3KpYXluM5Yuk /2Uyi9E5QVLAR1+nfQIHNcanxpAVfwVwsoRLZgzxz2d2zi0C
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The snd_seq bus got a dedicated probe function. Make use of that. This
fixes a runtime warning about the driver needing to be converted to the
bus probe method.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 sound/pci/emu10k1/emu10k1_synth.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_synth.c b/sound/pci/emu10k1/emu10k1_synth.c
index 662d20eb9689..26499c31eaa8 100644
--- a/sound/pci/emu10k1/emu10k1_synth.c
+++ b/sound/pci/emu10k1/emu10k1_synth.c
@@ -16,9 +16,8 @@ MODULE_LICENSE("GPL");
 /*
  * create a new hardware dependent device for Emu10k1
  */
-static int snd_emu10k1_synth_probe(struct device *_dev)
+static int snd_emu10k1_synth_probe(struct snd_seq_device *dev)
 {
-	struct snd_seq_device *dev = to_seq_dev(_dev);
 	struct snd_emux *emux;
 	struct snd_emu10k1 *hw;
 	struct snd_emu10k1_synth_arg *arg;
@@ -64,14 +63,13 @@ static int snd_emu10k1_synth_probe(struct device *_dev)
 	return 0;
 }
 
-static int snd_emu10k1_synth_remove(struct device *_dev)
+static void snd_emu10k1_synth_remove(struct snd_seq_device *dev)
 {
-	struct snd_seq_device *dev = to_seq_dev(_dev);
 	struct snd_emux *emux;
 	struct snd_emu10k1 *hw;
 
 	if (dev->driver_data == NULL)
-		return 0; /* not registered actually */
+		return; /* not registered actually */
 
 	emux = dev->driver_data;
 
@@ -82,7 +80,6 @@ static int snd_emu10k1_synth_remove(struct device *_dev)
 	}
 
 	snd_emux_free(emux);
-	return 0;
 }
 
 /*
@@ -90,10 +87,10 @@ static int snd_emu10k1_synth_remove(struct device *_dev)
  */
 
 static struct snd_seq_driver emu10k1_synth_driver = {
+	.probe = snd_emu10k1_synth_probe,
+	.remove = snd_emu10k1_synth_remove,
 	.driver = {
 		.name = KBUILD_MODNAME,
-		.probe = snd_emu10k1_synth_probe,
-		.remove = snd_emu10k1_synth_remove,
 	},
 	.id = SNDRV_SEQ_DEV_ID_EMU10K1_SYNTH,
 	.argsize = sizeof(struct snd_emu10k1_synth_arg),
-- 
2.47.3

