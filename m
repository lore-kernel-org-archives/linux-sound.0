Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D3746AF38
	for <linux-sound@vger.kernel.org>; Thu, 26 Feb 2026 16:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772123495; cv=none; b=QkU0rN//fxDp8r0nLPv7y8vQSm3T2n7wgwZfyP0LjY8juVIv8elqRo8gropXkPsCOZExTiUa2zOOiffqwB/WNEyZabokq/ne9WZ4niUeKHnRrWtcn4/Y3pINkHSvDl8UAzp1GjXdqoNLuIqic86gzOySxIBKruvzFeszjAiezu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772123495; c=relaxed/simple;
	bh=6qqVQ33hVXkAfsz+KcgW/oA+wyX6hEQTDpvT0DKO2g4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ztn/HZKRBivKW+XtjYWjgnb9LCPlzTE7so3IK+8sYcUPoSW32JX5wqfGHa+s90o+Ji/UmQmD8Z6vOlX0yERi4rCJMUe5Hk4NBjbNHjUYaFnh/ncGuCmfyZ3k2l8ywIMsITAci6iQ14P1Lsvt1LerzaxsHG1ygqZYdlVolil+R9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HZxRdLfR; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HZxRdLfR"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5688b639a19so518373e0c.2
        for <linux-sound@vger.kernel.org>; Thu, 26 Feb 2026 08:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772123492; x=1772728292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kXCR6g4/g6RlGQz2vJbBm0z0cr7lhrip1+owdU+eUAE=;
        b=HZxRdLfRvna7jmb+5xkqecr1ZTsqbrHcaBYwnyagBz4F9E9ox5VW1IgYPeXvKivLBg
         suSU/bpzZ0n5XjD9MHc7XkugWwJQMnPzISxzJPJqmDH1siy9bx8egcDb4mJ+j+WWexN5
         jRX0U0XQ3ECKryToI1pg8lQSF5mhFTr7Qvd0vcZFvkmNZ8p6zhFNOpGiP81EjDm0lMVJ
         hZZxm7sWWrjHgG/AXTErUt+fSIaVokSVIXrW/Otz2cr5matAYR8znGIO00XkkBmkBsH4
         hYdocp36vAT3gzpNjCGjcG0Uk4q7/QiiRu7AVDTfoWIVywFrRaY2NBbd84fstWrBdGWl
         oQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772123492; x=1772728292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXCR6g4/g6RlGQz2vJbBm0z0cr7lhrip1+owdU+eUAE=;
        b=ZIbRljoJI91+06GxS7W03WCbx2sZivAV//2a9NpqYLE+35TOE4u/RvSnWU5hS+Vm7h
         KJDMTTAGiJpW8q7mo2oUQLT7umMJHIZjECQTsVnN/QjioINfzXvHPqeNjTAtHT0oX3GB
         yUpoonIJhGSdOkN7mfayGqDY+FDpCIzWDbGkiZzotJURJRzH4sFNxGKAX5g/fHrpRp5q
         ykVlNAm00eB7+gXICxysZFRkIYm/RvVbCCZfAhJJOPPU6xUSwZqmyNQdPcjz0fQMEdb+
         K1diHWPTat/Qn385fxpYw7AUSVuxHu5SWNoJuJf8VFqVBN2NhmtqJ9UTGfa7KFyfEXAL
         vI0Q==
X-Gm-Message-State: AOJu0YzZBTb/ZhCdqW9LFUSPwSA5mhqGl0+4prDg+8WS45TOcuRqxInc
	SvqYuMSGJkTTDX4JYmYcqqsSoTah3pGXfNjs+Od45W/tWcHbqnqdnYGv86dilA==
X-Gm-Gg: ATEYQzwwWznEC9ilZd/XMMHXrdJkLtGOhHTxsRi2z/N/71IMITLfNEwz3r7IzGET5Qt
	CogwmyUwPvq3UB/XHxnGtnUiiiChozBs5gvpVxCN7BHg1B2ukDkNAzAVtyLf2t1+MuaJeCneyyF
	KCb43Yp0NAyQ2HLj2AYgyUEsEvOvVZIRnnnxR7d5GDEzoj6+1hJb/aaZNaRoWTlaONdGg3VFqGE
	JdGDej1fLnCTyVgw9gq9HVNmwSHdeaXCgtRvXfn9ADsHjbNtrUM2wc3ac5bh+Rc4930TLP05FrL
	lD2QXJowe5M2NJCFeiQPmoeE8wFu3QsNAOFtXMBoj4bdQcG0BHd999+3hrlTYiUfc50dq3h15mh
	qp3vdcR/Gvlh8SEvNJa1ztIQXoMP6b/NQk0hkT7IJhOsJIOcIclDIcd4EnA7PSBv7btxUUViJrx
	hx3ndUXzLghJXUORx+06raYK1KazmsOCCmxRG/LhtgkWrmY9M=
X-Received: by 2002:a05:6122:468a:b0:55b:74ac:72cf with SMTP id 71dfb90a1353d-56a8bcb4e16mr2525124e0c.17.1772123486335;
        Thu, 26 Feb 2026 08:31:26 -0800 (PST)
Received: from sh170r6.taild616b6.ts.net ([47.220.173.75])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c739f275sm19341256d6.45.2026.02.26.08.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 08:31:25 -0800 (PST)
From: Matt DeVillier <matt.devillier@gmail.com>
To: linux-sound@vger.kernel.org,
	tiwai@suse.de
Cc: Matt DeVillier <matt.devillier@gmail.com>
Subject: [PATCH] ALSA: hda/ca0132: Set HP/Speaker auto-detect default from headphone pin verb
Date: Thu, 26 Feb 2026 10:30:55 -0600
Message-ID: <20260226163055.825167-1-matt.devillier@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HP/Speaker auto-detect (VNID_HP_ASEL) has been off by default for every
CA0132 device since the driver was added in 2012. vnode_lswitch is
always initialized to 0 in ca0132_init_chip(), and no quirk or other
code path enables it. As a result, headphone jack detection works only
after the user manually turns on "HP/Speaker Auto Detect" in alsamixer,
which is not obvious on laptops with combo jacks (e.g. Google Link,
Alienware).

Change the default to follow the headphone pin config: if the pin verb
has presence detect enabled (no AC_DEFCFG_MISC_NO_PRESENCE) and the
codec supports it (AC_PINCAP_PRES_DETECT), enable HP_ASEL by default.
This lets firmware (coreboot, UEFI, etc.) express whether the headphone
jack supports insertion detection. Devices with combo jacks can default
to auto-detect; devices with fixed/no jack leave it off.

Signed-off-by: Matt DeVillier <matt.devillier@gmail.com>
---
 sound/hda/codecs/ca0132.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/hda/codecs/ca0132.c b/sound/hda/codecs/ca0132.c
index dd054aedd501..ca6cb57347ea 100644
--- a/sound/hda/codecs/ca0132.c
+++ b/sound/hda/codecs/ca0132.c
@@ -9816,6 +9816,15 @@ static void ca0132_config(struct hda_codec *codec)
 		spec->dig_in = 0x09;
 		break;
 	}
+
+	/* Default HP/Speaker auto-detect from headphone pin verb: enable if the
+	 * pin config indicates presence detect (not AC_DEFCFG_MISC_NO_PRESENCE).
+	 */
+	if (spec->unsol_tag_hp &&
+	    (snd_hda_query_pin_caps(codec, spec->unsol_tag_hp) & AC_PINCAP_PRES_DETECT) &&
+	    !(get_defcfg_misc(snd_hda_codec_get_pincfg(codec, spec->unsol_tag_hp)) &
+	      AC_DEFCFG_MISC_NO_PRESENCE))
+		spec->vnode_lswitch[VNID_HP_ASEL - VNODE_START_NID] = 1;
 }
 
 static int ca0132_prepare_verbs(struct hda_codec *codec)
-- 
2.51.0

