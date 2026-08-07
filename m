Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCA0472F6C
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 11:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786102936; cv=none; b=jBypKi+2sjQ1SztmIav2rK7IXlMfywfrIm5w/O3YVOETk514er/LmwijHt4f2EP3p55h2t8R7oTeP1IUGev1nT/0G5/HYuf12K0zvAi1QAuNiwTABwRFP4LPu7UENJYwjnCz0LYgzJjyBLQCmZmFO1dMFy/mtXbQXX/N2BSXuRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786102936; c=relaxed/simple;
	bh=e+Wi1O5qLB3tdT7qt3lctISNO+5OOpqeS7DJyRa6J0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h/WdNv3e/Hznz8loQp5CZKbNFNZsvKZjnGiLNV5e05L76Gy7Mv+w+Vk1rN8NA4GV/p6aQ8MVYa5vV3rpf5VAA1v7fZzgrHT591GnrtXtb0pp0KQ7jxVPgHwUpnNsr9lT2tyGVRorMoZAfsVHICYzIiQnmn8or6BOlT8LSn3pZyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mWuejuUK; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mWuejuUK"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3900e39d935so3082333a91.0
        for <linux-sound@vger.kernel.org>; Fri, 07 Aug 2026 04:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786102921; x=1786707721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TupgkS5U0yW4ptmWsSaBtKNrGrIzBwiT8uuCtS6g84U=;
        b=mWuejuUKSseItPsLB4vpEoEN+nekyx1rq2oROib+XeJtogsjpPRz7yWK+5GFMUN3Uz
         V8cdt65PExDPqk8A04QXzRtAWQux4N05RiSOkjcxuv6QdGP8dd0TtkaoGZFVoXEcNWAb
         RzwvpoG+HQaCdnnRIp+9YcPDv0FtpeEwSJhvV43DMrn1BGpuIjmTPMlbj21O1dzMl7NH
         sBQO/fHuMZcfjZXuMZWMDQ9SqvXIyZy27K/alE5it2X34lpfuVBHpZsh2Y1nD9DOpYJv
         QdPBdJnk/iwSIKatPN76ziYbSnJfcbMl79IBhpo4wXURAFuUt3gn8Lw5D7Jcyh+vtPCC
         ZZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786102921; x=1786707721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TupgkS5U0yW4ptmWsSaBtKNrGrIzBwiT8uuCtS6g84U=;
        b=a21xtdIjjRzX0zAd516l8xcsrlnhuor+F49FtSHw3sWhQb7+vKztwWO3ove8Z9o2fp
         7ccPqZSv+sDrSzVmvya+is3QTu3Jszg4NlEXvjfoI6JdzM8A7U7RdI/DwsrfWLMI6iql
         MauX+YHHKdvuWftaykqaAux0JJLCwfRMCNes5tLj7CKbHQFzbDTYOPcntyLlplKRZcLq
         5Ws7Nr7fUSaH+UdadWx48MDbcJSkijtVuihn8U/KqjTtIu+Tnaar3/R4/pIqRTVh9tQx
         e1gm9StRy3bAdrYKqMCYALX3jnAOprXFEOrWTqUjOn+B7PO27BWyyYiJprAqeVhPA+6f
         rodw==
X-Forwarded-Encrypted: i=1; AHgh+RrCl+fGD62UA9kBJUfCwvIuJdRrFGUVqNbw6tDEnf0ofwD0Ik1M+pvOvLAtC3Twp8DcWTTLXH/mQ5cDKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyvjKCIejepdeAxroN23Ux2D0GNMA9BTCEd81aXtiy4VvBm9Ni
	vQ2hhHbsMluWZE7XqXAFUGJQJdGmFpaXTYdftF4GZPqaCf3EGF3tSRNr
X-Gm-Gg: AR+sD13sq6SHcyO5C4vVm2eMDO4/KvvChqFjoP61vYavXpgB0MTvFGlM8/rgE6/QNVz
	bMQd298zFOK1JV9510GnUsOSQzy65XejC6VskTkYBsO0gEaJ6zx6j6ahpAWLe3RJ31WHwlu01RN
	E2HsXnYd6Q10W8+CTM5PoZSQe/bfkDi1KkTHh7gLHA6KgKAXgCPOwtfYT3VnegVJ+EeSkTyVXjz
	2OW02qJfAEMQqkRGeXIhDXUkqd55bFUTxTU92hhRC6oiygX1+yUf7EpvcoxpNV6yE43pVWyGCMS
	3bZVqOZ0x+TP4NngvtoVidNtzEnJeWDzERvPlDdy169Ue5d2atXs20ZuUq2KWRp8Iv2J/qmChL2
	0wz7QA9T+T1VujVktsi2lCPh3ka2AvLJE9WHGstT+vvuFf3GMCPuKPbvxC0waJYnoP+16dKs0zy
	11IwwgjX4hqLX3UbeiRGJP7QjnAev4aPUslLJa1IFE7IPe8iDC1muYgRe93hjcmqfuCCgxQ1FT9
	ohxVjUvXd4=
X-Received: by 2002:a17:90b:2dc1:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-3903c535d79mr25786746a91.5.1786102921248;
        Fri, 07 Aug 2026 04:42:01 -0700 (PDT)
Received: from localhost.localdomain ([72.255.58.127])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86d3fcsm6930508eec.4.2026.08.07.04.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 04:42:00 -0700 (PDT)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Subject: [PATCH 1/7] ALSA: ump: replace strlcat() with strscpy()
Date: Fri,  7 Aug 2026 11:41:33 +0000
Message-ID: <20260807114139.1661-2-mahad.ibrahim.dev@gmail.com>
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

When several function blocks map to the same group, their names are
joined with ", " and the separator was appended with strlcat().

Take the current length of group->name with strlen() and write the
separator at that offset with strscpy(), passing the space that is
left in the buffer.

group->name is NUL-terminated within its array, so the offset is
always less than the array size and at least one byte remains for
strscpy() to work with. Both functions stop at the end of the buffer,
so the string that comes out is the same.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 sound/core/ump.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/core/ump.c b/sound/core/ump.c
index 632c13baf21e..c6f55d2b8dc4 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -597,8 +597,11 @@ void snd_ump_update_group_attrs(struct snd_ump_endpoint *ump)
 			}
 			if (!*fb->info.name)
 				continue;
-			if (*group->name)
-				strlcat(group->name, ", ", sizeof(group->name));
+			if (*group->name) {
+				int len = strlen(group->name);
+
+				strscpy(group->name + len, ", ", sizeof(group->name) - len);
+			}
 			safe_append_string(group->name, sizeof(group->name),
 					   fb->info.name, sizeof(fb->info.name));
 		}
-- 
2.54.0

