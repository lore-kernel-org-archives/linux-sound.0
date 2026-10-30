Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377970;
	b=Ruy0k7pIGqtH/awHkMA2vtuvrA2pL5uavFoLlqHlRF0Ja/tRsBDIMYliOnt+YxAYhsTh
	 XGGR9S2USU2vFJusA7TSzi6AYjQ7qgf9RJvTvc66guJnZjeF/ssJUsWTr8dtfqhtRXIyX
	 mn5zOm9WF6S1GCjThXR/R7FGvBJYy7/1ObtVEBucBmTN723fntXIk8mrpm4pECbr7Dfe2
	 ImzpSqwo9jmCFHg6YUy4smFVhBSThoJ0Wgy2LmK/eKssijLewfvx6l9PhGwvekScUwqeJ
	 wNEi0TAQtYlT9HX9cxXRfRYjzNozf7SRSOr8ev+3UEUgvW6TnU5aSL3a5939FZA8uDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=4g4bBa15TQcCRqdP6/C6ogyt9YDhoGubfZMQbJjSRhc=;
	b=uy1QZhOLtqDhkVS597oIsARKNf4mptMTIeqfqpO6GnHq4CE+ERBLYDH6PE7dk8GQnq8I
	 NfL8RTHXkFvMM+AEVNal09jRfb2ptj5PGKOOf5GMFW38KYJiefiqVFpNl6yveFXBRhOrR
	 C8mnt7fBwbAshG9nHJilZTwcQyhzYI/RzOxeGbhm8UP7Mv8W7vl+yCryoeMgXKXJZoUbX
	 xey9e6uHLXkscEV5I1c2HDjwQ2wTaO9GeA95OmvvEbPkr46r8bDYSJXqeQq8VGNuWTh5b
	 lvSTzG8xxMmFWGEWs06JAjlZCUV6B87BFMYzFqo4Al4JCu8ovCEtPZAApFUqzhKwFCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="kBiqrbk/";
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27502606A31A
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 16:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27502606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=kBiqrbk/
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e09aa5264so474862f8f.2
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 09:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793377967; x=1793982767; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4g4bBa15TQcCRqdP6/C6ogyt9YDhoGubfZMQbJjSRhc=;
        b=kBiqrbk/dCQYNigE3JuppVC+5aXOMm3uDwohrN1p4hZSNpp1loTbvBmm+94OAVszBr
         t13ZJekGenonoNiPNUc7DZboP6mtCGnri5Twx+GRKwowegQbHPXP2pK6+Lg1Itz0pyAW
         q+k6+cboSWo48+n49U+IKM+Z9OfaDxHtlTxY0cAvDGvNG4AzyfiatrnAC5Zwu1ppXa9T
         z1ccX3bE2Gv96J4BH9qz8pJSIGaSgTkL0/HGSkEO1ASpKvlu3vvfLuqUZ2/+z8v6XKTN
         KSN1vRYOcCVQwvERkX5/oVtWZUU1ecU26j7kHnlnO+i76bniya3kLO3/9iFyE3MToNfV
         o6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377967; x=1793982767;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4g4bBa15TQcCRqdP6/C6ogyt9YDhoGubfZMQbJjSRhc=;
        b=DEL3l0CZaPD2yXs4bcR4Q68MFl4fJdka+Dc7Qsx3Cq3HGkH9Q1/jyhEOZMwgeeabM0
         hX5TdnACLntUFRRlI05ibRV8BWID2NKHa7FOXkiuyJCYAOHXSzjf4jfLLl/El3W+jxv4
         IeVQ7WQP9Xe9u6ACJ83fmiIh7I23/K2vjJkdsE/3mxCbTf0KLE/nsddL6nrEjabgsf83
         lLXsuw6zViVWHZj8BSChdHh8mwFB+3ybQqm2g2f7NLuD7w4380YyNBnFRuB0iY9UGVgZ
         ho+OPLzGzH9uOLI5ee8DCGJ7+vkjZgE+QDJfgn6YG5gZscm556QEEciEX+bKxb2UHo8V
         HkSw==
X-Gm-Message-State: AFq9FYK6othwiMVi37HuHnLpgndAvrrS4E/yoaZhvTneBHS+75IGGe9d
	i99AuJuVbcvCycVchidni91ejNhgywm1Qwt+bNI2tF3uQZlrFMYNjsVO1/LEseRdvSM=
X-Gm-Gg: AYBFou1bxhxNrSAehjBgzToB2Zb16mtUSgfT2MPRhBI1vdv7LfMpQwaj992slspgg3M
	3Mz0Jnxa+QE5VMZQ+/xXGPLIw57yDTJ8jv67X62pSEqjq2tsKTH9d7Dah0ZHcnftbp8hwLv685Q
	JAZAqkt+grQLdZwX4p13sjT0XMpPtrU1DJnTzqdkgtZCOvBGk61oPzJN3YXMDw0ECPRi+2skJyi
	EZUj9kJDfD9Kk0Pq5joUjfTkrlBib7MAHLNaHi9dATi/s4fFhPpwHrbl+nzvgqvf2vdPx8QgY3K
	m/7N8kbUvXMkmKdSDUeBbvzgnuGrrfV6GFgr+/2O12LQTik9Q6JQ4D3TSrc2DJbKKWHj+OADLnp
	HYXgfuWXT7ZvfFEIN1An1dYRiV5vkGLTogapcgjMdtROAaiA9eLvDiE29X7bD+a32D9f+CceXWs
	w5r3xduThHSoV3/CGALn0jcyy8PINis7bSHTFxWcgQGv8Rf0VF8gzkCUNLk1r4daj6dXk2WTjEK
	wo9xFiUcFAmuN9gKQO7GJJP/KM8FK+yNk4GzWGlM2bkGmPhbNgLb7ZZo1tgJSa0igjDVxzNui99
	TlRg0Tat6uly+NrFerAd4eZ/YzSor6s65muTjX2/4NsmZ2VYrjqivKqfs0blx67/bo/qdQ==
X-Received: by 2002:a5d:588e:0:b0:48e:6bbb:c3f3 with SMTP id ffacd0b85a97d-48e6e2fd071mr6553038f8f.28.1793377967347;
        Fri, 30 Oct 2026 09:32:47 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71bae25dsm3528697f8f.59.2026.10.30.09.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:32:46 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/2] ASoC: meson: card: fix driver remove
Date: Fri, 30 Oct 2026 17:29:52 +0100
Message-Id: <20261030-meson-card-register-fixup-v1-0-6474985e94f6@baylibre.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQrCQBAEvxLm7ICbiFG/Ijlkd9s4gpswk4gQ8
 ndHPfShaKpWMqjA6FKtpHiJyVgcwq6idO/LAJbsTPW+PgYfP2Fj4dRrZsUgNkP5Ju9l4ibE9nx
 qcnuIgdyfFH782tfuz7bEB9L8DdK2fQA9Y8sMfQAAAA==
X-Change-ID: 20261026-meson-card-register-fixup-31b7983d74b1
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=660; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=fXalk+osyG8+ZDMUyak0NQXBdifxrSPFw4QoLcm/1KM=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlPjq27xpM6JbNrbZS+3gUH2UWJRwWXvzs54T53dvrNP
 OsuwaMqHaUsDGJcDLJiiiw13NXi7yS1vsyarnMbZg4rE8gQBi5OAZhI83FGhmOy6VOFZrpkt/9+
 JvZO33RJ8RuX5D19jk84d99jdl62dDUjwz/NL/wOz9/2mnOfb741b3nRzpd8yhcs538x/+P47b+
 dDAcA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

meson_card_remove() reads the wrong drvdata and frees the card links
before the card is unregistered, which crashes when the driver is
unbound. Fix both.

---
Jerome Brunet (2):
      ASoC: meson: card: leave the device drvdata to the ASoC card
      ASoC: meson: card: unregister the card before freeing its links

 sound/soc/meson/meson-card-utils.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
---
base-commit: 11ae63bd9030349a0136fb2edd1622a4a029edc8
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
change-id: 20261026-meson-card-register-fixup-31b7983d74b1

Best regards,
--  
Jerome

