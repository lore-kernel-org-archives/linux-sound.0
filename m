Received: from mail-lr2-f4.google.com (mail-lr2-f4.google.com [74.125.230.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2394E4A99AC
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 11:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473272; cv=none; b=Iv9Lnm9ODROZ2Rj6rpoIMU8D5bqW6z5zNNAyCKfIQ+BtvmIJSL2Vp4skLm9/D1PlFE1+nfQvne3IYwH97/GCAoNDryWveAyxPZPYvDjFJbO9GTRq6QXEy8maqFjreaU24QOsq9TWJPluTp0ZY+lVyGVT/Acd/1WgEpoFpjtKaqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473272; c=relaxed/simple;
	bh=4XUMdGNNDdDpAAwbuOPgfyiNEZsB2ALa50w4MMtVLVI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=j1AH50lJr279YXJEJd3v5U311hHC7RDf0zMS1Rif7IvM8dNOyiSstlfXtXLpjv898LotI7XQfkccut092ZxOOI1Cc/u9DpVPZat3Dl3G1Ac8uwiJxwD1MPrkOMW0WjW1/KzgqZpi1oB3QICSgrNGHMkGQfijOa11Zr6ekKVCwo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FigqRK52; arc=none smtp.client-ip=74.125.230.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FigqRK52"
Received: by mail-lr2-f4.google.com with SMTP id 38308e7fff4ca-3a48db5ecfcso24100361fa.0
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 04:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789473269; x=1790078069; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xOQoh1y5NM/04T86C2Jn4EMNc9+KHCfk34Vs3gnxreo=;
        b=FigqRK52Rn2Y8/VXB1shDMAozSXPXg9xWtWgfLoPoUHkP0Lb45WjwlmCYNsXceluIw
         YWBH4+KZXnpFYeMgLzUoiG5cyMmX0dX8Xb7d3g046ehJCH0pyPAxMllY1Z39YPRaweoT
         Yud8YIm3GZOApFDqxtve9Aly4+A8TjVIbWtqRjt9SJpVnYDYrIJ4beLAalYiJ18ty7rg
         ti2MH4bChR0hH4FGGskn6cf/NBxFDnI1WayX2IaukVDyTMyDIXz1nVigJgcyhGhFAqbx
         kLuizIlbBRoYG7YrDzyyHjrtPOjz1HqIcuSDMkBaqnBJXhS0BR3MqQALmpSUev9BWiNQ
         fHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789473269; x=1790078069;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xOQoh1y5NM/04T86C2Jn4EMNc9+KHCfk34Vs3gnxreo=;
        b=c2wHLViVTioSRNr+Ul/0KABIbmLIElABYKuvpBs6587IGUwVx+koNGsT6QDW1ZNJvg
         jgyK5gB3qkB/ah5XBFjjVwy5NgVmA5cRw4yfsY9pUG6csZZxMef9W8kwAsHNYd5WaHac
         9SWlbfFCH60M/OdgVY3unUki5CJpWrKf9ur912/kYBivtDrHwGyepuvicfxmBmHPgj1j
         xkf5ZRJDU6tYav1MfuKPpXbdHyCjexeGQxPk37yLz9cPjmCu152Q3auZU3nz1xG4qcMa
         WS9w0ZbHjTzXVuBAJew3zIWRmkCKwjDk1l9YlWxIePx2FskICl73jqHDO/I/PfsXZwah
         O+Uw==
X-Forwarded-Encrypted: i=1; AKwUvBwUneGBUHH8/oZCm8lUxXkfAkjKTH8aaYNerdEYzSida2LE0NkbgqMJzmHuaUbnGwAIItLGyyOuMLBwZg==@vger.kernel.org
X-Gm-Message-State: AFuF++khfZkZQnobXcz79wRb3hVgbZr3qkMOZi89roicfPtgrMCINCWf
	NjMsqjry4+wLFrsaR7hF3r+tbZL7gje0OBRZcIO+a6JXVH5kWhWdVUXg
X-Gm-Gg: AYBFou146uje+63jCknfQMHenQLNGoUlZiQhM51vAKhruOF3YXaVfIqfv/44S3t9tfi
	RQZNcxXYIeCCrUnT7XogUw/40AC8yUXfmYJvOGdXnJnu4ZTdDccDa7p23lkdTI9Mkxw65eLX5ga
	s5u3Cl7LmR9BoScUdKK4Fou9dHyrwII3Dg0itu2e+gHyXZ+rCqoHqKdDvUc04bHlCQOHker6Ny1
	QZ+82o6UTbpXRLCy3O3ErqicB4Z5tAvMxzPICxHg4ANrOSxY9XXCNCAFUUvso2T2lNSFeCzfdum
	ySTaNG5itlILCikg7ZVjO+kP0P4ObBIyOFU35T6n8WW5cwf4Vmqhv9Dta/khrbMSSv5qQFfb343
	BcuiE08cH5QNg6pcck4KQS1Q2yGiQ6oCI5OWvWoqOIw0Q0J19t/TvAtuNMPROSVWFVi6cUn/fTT
	tCy+FkYc/V2zZLgp9KvPNzS79NewrN/rX2HIW+zmhZ7+aBovmbQJ4SLz3fmyWMujUipXTg1Zy6d
	VaMn7bod3pt/hUmbklll56UwEo=
X-Received: by 2002:a05:6512:110b:b0:5b5:e7a8:9b1d with SMTP id 2adb3069b0e04-5b8ae68dbafmr4041728e87.13.1789473268925;
        Tue, 15 Sep 2026 04:54:28 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a334bae0sm33906521fa.24.2026.09.15.04.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 04:54:28 -0700 (PDT)
From: Roman Demidov <roman.demidov.nn@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roman Demidov <roman.demidov.nn@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	Tim Guttzeit <t.guttzeit@tuxedocomputers.com>,
	Werner Sembach <wse@tuxedocomputers.com>,
	Kailang Yang <kailang@realtek.com>,
	Zhang Heng <zhangheng@kylinos.cn>,
	Sean Rhodes <sean@starlabs.systems>,
	Damien Dagorn <damien.dagorn29@gmail.com>,
	Martin Hamilton <m@martinh.net>,
	Bharat Dev Burman <bharat.singh7924@gmail.com>,
	Lei Huang <huanglei@kylinos.cn>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Lucas Tanure <tanureal@opensource.cirrus.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Denis Arefev <arefev@swemel.ru>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 6.6 v2] ALSA: hda: Fix missing pointer check in hda_component_manager_init function
Date: Tue, 15 Sep 2026 14:54:08 +0300
Message-ID: <20260915115410.106036-1-roman.demidov.nn@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Denis Arefev <arefev@swemel.ru>

commit 1cf11d80db5df805b538c942269e05a65bcaf5bc upstream.

The __component_match_add function may assign the 'matchptr' pointer
the value ERR_PTR(-ENOMEM), which will subsequently be dereferenced.

The call stack leading to the error looks like this:

hda_component_manager_init
|-> component_match_add
    |-> component_match_add_release
        |-> __component_match_add ( ... ,**matchptr, ... )
            |-> *matchptr = ERR_PTR(-ENOMEM);       // assign
|-> component_master_add_with_match( ...  match)
    |-> component_match_realloc(match, match->num); // dereference

Add IS_ERR() check to prevent the crash.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: ae7abe36e352 ("ALSA: hda/realtek: Add CS35L41 support for Thinkpad laptops")
Signed-off-by: Denis Arefev <arefev@swemel.ru>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
[Roman: Instead of modifying hda_component_manager_init() (which does not
yet exist in version 6.6), a check needs to be added to the
cs35l41_generic_fixup() function—the very function introduced by the
offending commit, which calls component_match_add() without verifying its
successful completion. A check should also be added to
tas2781_generic_fixup]
Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
---
Backport fix for CVE-2025-40097
v2: 6.6 is missing 1cf11d80db5d ("ALSA: hda: Fix missing pointer check in
hda_component_manager_init function") as well, and it is the newer tree,
so 6.1 cannot go first here.
A 6.6 version also needs one more hunk than this: 6.6 has a second
unguarded component_match_add() in tas2781_generic_fixup() alongside the
cs35l41_generic_fixup() one.
Send a v2 covering 6.6, both call sites, and 6.1 
as Sasha Levin <sashal@kernel.org> suggested.

 sound/pci/hda/patch_realtek.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 937f3fdbab25..a020e824fbb2 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7052,6 +7052,11 @@ static void cs35l41_generic_fixup(struct hda_codec *cdc, int action, const char
 			spec->comps[i].codec = cdc;
 			component_match_add(dev, &spec->match,
 					    comp_match_cs35l41_dev_name, rec);
+			if (IS_ERR(spec->match)) {
+				codec_err(cdc, "Fail to add component %ld\n",
+					PTR_ERR(spec->match));
+				return;
+			}
 		}
 		ret = component_master_add_with_match(dev, &comp_master_ops, spec->match);
 		if (ret)
@@ -7084,6 +7089,11 @@ static void tas2781_generic_fixup(struct hda_codec *cdc, int action,
 		spec->comps[0].codec = cdc;
 		component_match_add(dev, &spec->match,
 			comp_match_tas2781_dev_name, rec);
+			if (IS_ERR(spec->match)) {
+				codec_err(cdc, "Fail to add component %ld\n",
+					PTR_ERR(spec->match));
+				return;
+			}
 		ret = component_master_add_with_match(dev, &comp_master_ops,
 			spec->match);
 		if (ret)
-- 
2.53.0

