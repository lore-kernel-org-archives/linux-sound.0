Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3152609D5
	for <linux-sound@vger.kernel.org>; Wed, 11 Jun 2025 13:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749647321; cv=none; b=uSxZ4tcUg0qPKlYHY+EQkaERAJBH6y57M4HBp/5Q6GkgwClRq7Rot0XIw5PbbdDtgzjLXXZt8asr4/N59Sb3G21C6LbYdW9/4TFlIwsHovksT6kWQfkGQ2vcmKgijp9yAFQDd9N3qmI7L5qvqKARkZ+jEndrs//FawivLlX657g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749647321; c=relaxed/simple;
	bh=NpnlGS+RfAUP1yAlohXjTYdt1pVsFCAm4rXRoM0IsFo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ciZXGv2kJmXUTlworbdjF9co1O2QzXe8PDcTwlK8DG0S0ucfbTeXxZRfnPMy0G7663Evir2x3khLbWMHkV3QMq9cDO5h8hQmi1ZWa3JLZqLAKOzTp18YFdEWPGUOP34C8t8Qlk7aZV1KD2IAp3MDwbYCcYFsUAqATDZE3RhjRwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R6e+Fxm5; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R6e+Fxm5"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45024721cbdso57102325e9.2
        for <linux-sound@vger.kernel.org>; Wed, 11 Jun 2025 06:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749647318; x=1750252118; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e22TsvH4RGJKGMMRWkswOq9iBPLvNBJezKH7Y1TV0R4=;
        b=R6e+Fxm5+wM6OmiD/CaTtNNLlGFv45YaG2ojzmWcHCqyFrnxZSmjjOyD6LzVFeu5J/
         3czBxOPGxE8NEeKS6DR5icsRNPQUrkWdH2yJnF00cJhzXowBfiKahTVYPLKWeMqtFj5V
         OnvutvLRenMolAQHnDSPvgW4k5kc+yUsYXBZly67q4zQvKj3IRd3UqSeLZ1/PU/M236Z
         l3MuF4eU18g4sThtGJctC8bAn1r45uZeDXOVNaSxBcIXj5I6PUuZFwHG9MVaFSYK8aVP
         9tExzKsY9k6wI9vNXXjo27UrmlWLhTaHrdyIPD29x21fizbGpwKocikYPvO2z2VY95k1
         VpnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749647318; x=1750252118;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e22TsvH4RGJKGMMRWkswOq9iBPLvNBJezKH7Y1TV0R4=;
        b=eToPix7IH200KUIpAuafnk5NW2zOwHVjNNSPd5rPunUBl46L8iXiRcr93p69PDcWP+
         +br5MtRbDuSIjlXyQnmnLp2Q8cVAcRkrkAWQfoLq0qiyv7tMpfQMu4o5p92dpbgryy3x
         ZOxVvc7MhRd/ifAtlTTheZVYx9D58Gtp5Fkd6vx14mvztns7TVfC4mMp9hF1NtLW4jFj
         P0TzPTuaJwG108qxKKX97ao821whaTFP4wek319dTqtKPwZhmGmOycEc8KtiP4KTcu1z
         1H04OxsC1Fs8Jq4jjYep+kc/5ua/5byvFDwgUjgaBYUXE4WFjGfvztZlK+HDwJNBAd0t
         VECQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8JdUbud5YbYUoT4Jno8pmW3yld7ZqmSSnKj/s0J/eb6iiXHeE37GmmmKB45JupijBjJiCr3l8kOGWig==@vger.kernel.org
X-Gm-Message-State: AOJu0YytKR6OwdrSI9uU0ZxGI/jmtxjMNG/G26O47l9PvZ4MhAQ25SfE
	F8KDzabpJgkLv17/Jww/1/ETS0wefjTADQwENzojeJ9zKvtpieHtg1gn1R4WdKvK7EloZ22qIqI
	Sph/Q
X-Gm-Gg: ASbGncvVQPNhQDxCVNu+N6pi73o0m2KgXgE2FjGIFsz8CkuhnGuECvzTDu3EK/GYY21
	VidYxyaLf0HgbtsUz/QU+30iQN/w8nHmnnSwrYUx2DSjHnYvnb8+tmDkZcN4rn/DsIXRwV89dd9
	URSxe0VGiVNX0V4x7s9JosWiED+J9YnDb491jcAZxOpZIeR5Lpex4VlTq54Br4BfA2CgCSxYSRE
	GfB/dPP6tYRvgwGrxgSCpjuDD8NxdFmwjyzQyjA0voczN27HqXAlKRg4s3EPY5bbbg8S+NnIp1/
	mjmS4N0oPkEAWd07Kc2rYeP4yKgkS68oGOrKtwlngxeFQhvWfyZHb7OWqqpAJoVjE5g=
X-Google-Smtp-Source: AGHT+IE9fPV/FMEdv4vx5pe2XHdcJaxNKNwxiFMcA9E0/Gzx11yqf9R5n4B9o6ccUjq2b0WV3jYKyw==
X-Received: by 2002:a05:600c:64c5:b0:450:cff7:62f9 with SMTP id 5b1f17b1804b1-453248c3bdamr25114375e9.22.1749647317534;
        Wed, 11 Jun 2025 06:08:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4532522669bsm20508125e9.35.2025.06.11.06.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 06:08:36 -0700 (PDT)
Date: Wed, 11 Jun 2025 16:08:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>,
	Lucy Thrun <lucy.thrun@digital-rabbithole.de>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ALSA: hda/ca0132: use snprintf() for kernel hardenning
Message-ID: <aEl_0XoK4Q__MOVU@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

In this sprintf():

	sprintf(namestr, "%s %s Volume", name, dirstr[dir]);

Then "namestr" and "name" buffer are both SNDRV_CTL_ELEM_ID_NAME_MAXLEN
(44) characters long.  We never actually use that full amount in real
life so everything works fine, but static checkers complain that if name
is 44 characters then when you combine that with the other strings it
will lead to a buffer overflow.  Using snprintf() silences the warning
and makes the code a little bit safer for the future.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/pci/hda/patch_ca0132.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index cfe422a79703..5815552cbf89 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -4409,7 +4410,7 @@ static int add_tuning_control(struct hda_codec *codec,
 	}
 	knew.private_value =
 		HDA_COMPOSE_AMP_VAL(nid, 1, 0, type);
-	sprintf(namestr, "%s %s Volume", name, dirstr[dir]);
+	snprintf(namestr, sizeof(namestr), "%s %s Volume", name, dirstr[dir]);
 	return snd_hda_ctl_add(codec, nid, snd_ctl_new1(&knew, codec));
 }
 
-- 
2.47.2

