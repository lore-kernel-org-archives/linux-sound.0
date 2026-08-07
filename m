Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C59737757C
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 11:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786102959; cv=none; b=bOhBRdb5JOr/Q4Wt8Hlo8cOLG23U3D7Bplg/x8JxH6xQVVTJODERpEzYzKJl1DyCY1I1isxcpDfy+lsTvHxiZLTLuzkCDw7HKac5ky4HmE9Uz3+3AeS+1ueoIasboOTOzgbwZrmkUU7pM5xVFHJALUbbZcpcWaWh64kVyR8fn58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786102959; c=relaxed/simple;
	bh=oT5T3dLFneium61Yp5EjmuxugXHqACAQ0RatMGQIiRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A8DSdugk31Jl2yVhSBQ0hqxSIQDRJR/1JfbEJTqGk589M+krDqvwSCeprLQujlw9rIi62KxW8GeGpJnfE2uHzuzLnA8jZhYLNEuHC81sqZiJkXhwz15LmMElobrdUH1tyALySGjgVHVF0LzJWUStJ0fMgcTaHiYPgpIDA46wBzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sS1pRKWd; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sS1pRKWd"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cc97653887so38117335ad.1
        for <linux-sound@vger.kernel.org>; Fri, 07 Aug 2026 04:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786102948; x=1786707748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=djjh8aS+tjNvT4Hn4JXEMFIbSSiOro7lhmqj3kM/upY=;
        b=sS1pRKWdGrYFU27mdgh53EVy6ttSEHlP/f9BsaiDJPUXPKw7De7ZL60TGoB94V4q6c
         O8/mpElHzj8erOJI9aoHW6OAG2+yulAYJBx4C0sMZk78QyR32veQk451fktF5V2+TsOf
         sx+W7L8p5w6/xTQIJAFJaxFoCjOJlDlUSJbSjNqG2Yc5pAVESEhKdDt8+dXpS2Hla1Gu
         Ze1kPJtbOJ14WEIw2lWTOVmN3kYBQd5v6MQ6WqSBFHLGTJYtOZhFzuTusAd+r5ico+PH
         zO5Ljz3PKPynwWDOTXAhOeKl1bPscl2ajQkgSkBwJlXlR4cCUECNy/LOrSksLaAeLHwM
         jhwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786102948; x=1786707748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=djjh8aS+tjNvT4Hn4JXEMFIbSSiOro7lhmqj3kM/upY=;
        b=FIuyOIknhJghwnAxvFvdBK3CtDj9HBkpq5qDAH4nGRS40jMADVyfmqDANMbaV+29xE
         v2DJA+wOr+ZLPd/gMAykCL7Ut51SJOo0Rg1GROVlTvrvgpc72lZtWlfi9BGod090nZFi
         liau7bRwKoK9t67SvJrXl9dRALKdrNRPpQFNjA3MFENYzzE4QpfLe+JILGr3bjOPXwrk
         TP94SgUwJ8r1vPOlG/UK0w6qrYm4tOQwM/RotuC7r6xwE5W7o2YYhP2eQBP7r+29xK9j
         GY28FmLzmnmce1yIi9X/QxoF9o74sdU/+NNnIpAhjd6T34Ez6nombfN1ZFrdAaQ56GhP
         Q3Gg==
X-Forwarded-Encrypted: i=1; AHgh+RoZU0mhqGPFgW3yIqJzh39OMgcj+w600NlTxZ7jgUomCOzbSPQIhX+BCKhql/eO6rwuIBC9StxSoXuFzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxetHqYrB9UIFM9+n8bFzWZ7ALsoLc8LPl3dKMRzJkkRmgozh9w
	mkGqfo7I+nu0DGItsnKZZXrYk0q+arQUhu9B5h+Y8xwKJULW68yzI2Be
X-Gm-Gg: AR+sD13rm1a56AypJ3Am6uuPLb2XzJnlCxB+t8Sn71Q9WWNSbQOc+zpzcvF1QdRC+nk
	YrTxDABlh4xs5X9ibmVyuIboSMkj/vVQItFtn2PQyoSh3EaFyWC/35+IRmGYR0+tNKNSLKarzXU
	cHQTD0yoLvG3jl6tPj0w1xDHQ+wOGs1c7rUg9tc8NqPO8x7FCaE9Pg0fvOsjcBsf9YKGBJqY8i+
	VpSwU7yM00My2CwsoMy+dMPXTwvnv9jPlYUTaOVVRu4rVoeQWpCOCAZlusxbP1Q/vti3v56Ojbe
	IgDSHKI/zoRefk4It9navd0jOEA5vDLEji/F2e33jHmxyuCyaJVY7Nkwm+Tbnsq+9tUEkTrBARO
	DFr9O8ZxmgK1t3lYFAKoM2FT7zDYWOoC+1gTmkuwdE7lTy+6+bXUPhygcz7w1YxolxQ0uD6rtDy
	PCRC+6vVUhrITE2Gv9txvk81rvn037shc87NZGmfDdhtaNOaFnv0hUQJXGn2aF3RmcZ+Q5QUsqX
	u9NkRqddxsCfHAtDvMNsA==
X-Received: by 2002:a05:6a20:7f86:b0:3bf:9c93:ac44 with SMTP id adf61e73a8af0-3cb85ea363cmr20852727637.19.1786102946899;
        Fri, 07 Aug 2026 04:42:26 -0700 (PDT)
Received: from localhost.localdomain ([72.255.58.127])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86d3fcsm6930508eec.4.2026.08.07.04.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 04:42:26 -0700 (PDT)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Subject: [PATCH 5/7] ALSA: usb-audio: replace strlcat() with append_ctl_name()
Date: Fri,  7 Aug 2026 11:41:37 +0000
Message-ID: <20260807114139.1661-6-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260807114139.1661-1-mahad.ibrahim.dev@gmail.com>
References: <20260807114139.1661-1-mahad.ibrahim.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

append_ctl_name() appended to kctl->id.name with strlcat() and
returned its result. build_connector_control() open-coded the same
append for the " Jack" suffix rather than calling the helper.

Take the length of the existing name and write the suffix at that
offset with strscpy(). The return value is rebuilt as the offset plus
the length of the appended string, which is what strlcat() returns:
the length the caller asked for, whether or not it fit. No caller
currently uses it. While here, call append_ctl_name() for the " Jack"
suffix instead of repeating the append inline.

The name that ends up in kctl->id.name is unchanged, and so is the
value returned to callers.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 sound/usb/mixer.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 703c118f9d4e..77335bc89aa0 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1748,7 +1748,11 @@ const struct snd_kcontrol_new *snd_usb_feature_unit_ctl = &usb_feature_unit_ctl;
  */
 static size_t append_ctl_name(struct snd_kcontrol *kctl, const char *str)
 {
-	return strlcat(kctl->id.name, str, sizeof(kctl->id.name));
+	size_t len = strlen(kctl->id.name);
+
+	strscpy(kctl->id.name + len, str, sizeof(kctl->id.name) - len);
+
+	return len + strlen(str);
 }
 
 /*
@@ -2116,7 +2120,7 @@ static void build_connector_control(struct usb_mixer_interface *mixer,
 	}
 
 	if (check_mapped_name(map, kctl->id.name, sizeof(kctl->id.name)))
-		strlcat(kctl->id.name, " Jack", sizeof(kctl->id.name));
+		append_ctl_name(kctl, " Jack");
 	else
 		get_connector_control_name(mixer, term, is_input, kctl->id.name,
 					   sizeof(kctl->id.name));
-- 
2.54.0

