Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439193502A7
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 12:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785846980; cv=none; b=KPO8TVWDLltrP70kJOpGX9OzJSrU9o9KTpRXnhH6J2If1B4rdwXde3bq8dT3cc/Hf+LM8BwLhc1OqEJGcDbChZbezIqvSiDRVMizOA9728qIQjVfabDKhaB8TSYFj6T6KnkyKW/Rx8Sp+6KkyJ+qRGWBYhzpCgIsvTISF3wgvhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785846980; c=relaxed/simple;
	bh=oHaM34hp+B9wAo6Y7dFZXtCxJZUfh5bqm1Nuxuql9Zk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sL2yUeUNtxQAwqjG723CjCNIMXW5WGzIKolJ4p3pq4Bqy2v9wR9yZDwFsSZWUH3tkqrYISd4syQxGmhYf5m2W3bSKhdueo0gaRtqMUwLBO5wC2D/ZDuppc/XmRSXuuQwkhQ8hoWYuMExn8/FoC8EH3UHrhsyBDN8Nih1fSOejqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xbow.com; spf=pass smtp.mailfrom=xbow.com; dkim=pass (2048-bit key) header.d=xbow.com header.i=@xbow.com header.b=haNHaKdR; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xbow.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xbow.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xbow.com header.i=@xbow.com header.b="haNHaKdR"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8453427d3f4so4925514b3a.3
        for <linux-sound@vger.kernel.org>; Tue, 04 Aug 2026 05:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xbow.com; s=google; t=1785846978; x=1786451778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ACp9n2o3Ordwb2znUSpgKmVNWolGQJeT8LdRSV1/Gjs=;
        b=haNHaKdRvadfIfFLC6UbmprU1LvMKpyi/cHhEHtQSDoetWSl76L6oJwNN2ZOS6rvQf
         E0kMwPRQhw4xlr7PUmIfEpkulxpynCVg9Va9ZHrVFapprymRpgKxf+AUNnqlNSyEi6V+
         pgyja77egGtcmz/TUxdlPW9GTlqM41fnPECt7PDV2bbLMmwcKHPc6Y9+gW/YyCqRB7Ix
         wLp0wLVVFPNuOuSFMjaLmwSfEJGfpvX2IMMWyRgsH+m+IAABT8T1dm/+Tz0n478ib4FS
         alTiYP/pfCWU7Zk1kISbxzw1aG0tNbvEaOui632mn5Q5hDFQ0Q8i8YGokGFLCTW/13wI
         LO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785846978; x=1786451778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ACp9n2o3Ordwb2znUSpgKmVNWolGQJeT8LdRSV1/Gjs=;
        b=J8c1bXuqjyjdhIqiXzZ/obAaY8CTg8pOyCZJBdP5jQKiO0TiPaHY6OimhMZnlwT3Uh
         bbJMil/SSNJeGSZ3hSNUvd8rOC/6KikuyV1qs/y1sqQD3Sdoum+5HfJva8gjprnJ8fBW
         wJqqz7VY25OjCrU+V4FZm6cnuBYc42svlcz+3rLQN5xww5SPPbRvhPGZ0ldA3S/kKeT3
         RXqcPPEiIf4p97gdBpd8v5zLflETuYCBrR5KPkBXWtS1fw5qCuRRnukz89IuKT/h68hF
         hPJJltuy2LLsOT4z81l1EaaDbbxw6MeWlbL79PncMbOwBGTzAHh+dHJ+qL/mlO8zuPvS
         3AEQ==
X-Gm-Message-State: AOJu0YyUMbqcWyY+TcWXuV28/2TaITW/fGKq3udzHoMCfgIAJRGUVYYD
	yqAnNQjZin3krpZgzqOEY1QVT1C5eDw89OeEYdj/CNn/EGKpy/8YpoDGow2YDxlmy5g=
X-Gm-Gg: AR+sD10+rw8bAO9UEnidvgtUqplSV29DSccD6xU1Bq+3YGPqJJTB1e+6isTBG4x7V+0
	iyhz62sUhDdEIBgw+RP8WSI0M0Nhax8XGOh58xqzBgp43idXRwrkPlFVe3llTfHaWamm3n39N4Y
	wDkB/jZI57Ox68oYa0NJlUtqM48nvLGGx9jFFpiUFmaAD17zeaSHdbTXx0JZjQSnRcyKUcj3KwO
	w7tfkDXgchlHtk3xcYbSqo8GF3QpKSV0W+VUt+Dyecia4r5Aan9qtd6oDdgtJ56pLPsxu7wvQcW
	06Job1ChyMp4bRW3WOnTl7FuvLqg5aceXDTqNG9M00glqcDcxp4t4O7XSsPLnSvqQNW90M5eLVB
	L9y7Glb4RWYnXZWJhYyS1NvvjFRZCKQ59MrKlmvOO2taKPlpSYkqcz8V3x+SZxLaMV4zmrNy+u0
	tcITsw/9Hz6pqrb2ffaRwCRb2cnS8cvRFXWRrMzOMSetRlyMO5M+4tSm6Jz7zCLhSpSoxJ4tTnQ
	Toiyu7ZwIStd8kuK8pNa4ukluYQt/lVdWNLDJA=
X-Received: by 2002:a05:6a00:4652:b0:848:2f7a:2e5c with SMTP id d2e1a72fcca58-84ee499eab3mr12628434b3a.75.1785846978444;
        Tue, 04 Aug 2026 05:36:18 -0700 (PDT)
Received: from Mac.lan ([125.128.148.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbe593basm5086345b3a.21.2026.08.04.05.36.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 04 Aug 2026 05:36:17 -0700 (PDT)
From: Baul Lee <baul.lee@xbow.com>
To: g@b4.vu,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	federico.kirschbaum@xbow.com,
	stable@vger.kernel.org,
	Baul Lee <baul.lee@xbow.com>
Subject: [PATCH] ALSA: FCP: fix OOB write in fcp_meter_ctl_get()
Date: Tue,  4 Aug 2026 21:36:11 +0900
Message-ID: <20260804123611.91715-1-baul.lee@xbow.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fcp_ioctl_set_meter_map() bounds the user-supplied Level Meter map size
by the driver's own limit of 255

	if (map.map_size < 1 || map.map_size > 255 ||
	    map.meter_slots < 1 || map.meter_slots > 255)
		return -EINVAL;

and passes it to fcp_add_new_ctl() as the control's channel count, where
it is stored as elem->channels.

Every control read writes into struct snd_ctl_elem_value, whose integer
array is declared long value[128], so the limit is 128, not 255.
fcp_meter_ctl_get() stores one 64-bit word per channel into that array
with no bound of its own:

	for (i = 0; i < elem->channels; i++) {
		int idx = private->meter_level_map[i];
		int value = idx < 0 ? 0 : le32_to_cpu(resp[idx]);

		ucontrol->value.integer.value[i] = value;
	}

snd_ctl_elem_read_user() serves that object from
memdup_user(_control, sizeof(*control)), 1224 bytes on LP64 out of
kmalloc-2048.  offsetof(struct snd_ctl_elem_value, value) is 72, so
element i is written at byte 72 + 8 * i and element 144 already lands
past the allocation.  At map_size 255 the last store ends at byte 2112,
888 bytes past the object and 64 bytes into the adjacent slab object.
The stored words come from the device and meter_level_map[] selects
which word lands in which slot, so extent and contents are both
controlled.

The core does not catch this.  snd_ctl_check_elem_info() is reached only
from __snd_ctl_elem_info(), which snd_ctl_elem_read() calls under
CONFIG_SND_CTL_DEBUG; without that option snd_ctl_skip_validation() is a
compile-time true.  __snd_ctl_add_replace() validates kcontrol->count and
never inspects elem->channels.

Installing an oversized map needs CAP_SYS_RAWIO, but the control outlives
the hwdep descriptor that created it, so the out-of-bounds stores are
issued by any process able to read controls on /dev/snd/controlC0.

KASAN on 7.2.0-rc5 (arm64), triggered by an unprivileged control read:

  BUG: KASAN: slab-out-of-bounds in fcp_meter_ctl_get
  Write of size 8 at addr ffff000017af04c8 by task fcp_trigger/185
   __asan_store8
   fcp_meter_ctl_get
   snd_ctl_elem_read
   snd_ctl_ioctl
  Allocated by task 185:
   memdup_user
   snd_ctl_ioctl
  The buggy address is located 0 bytes to the right of
   allocated 1224-byte region [ffff000017af0000, ffff000017af04c8)

Bound the map size by the ABI limit rather than by 255, and bound the
store loop at the sink so it cannot run past the value array whatever
elem->channels holds.

Discovered by XBOW, triaged by Baul Lee <baul.lee@xbow.com>

Fixes: 46757a3e7d50 ("ALSA: FCP: Add Focusrite Control Protocol driver")
Reported-by: Federico Kirschbaum <federico.kirschbaum@xbow.com>
Reported-by: Baul Lee <baul.lee@xbow.com>
Cc: stable@vger.kernel.org
Signed-off-by: Baul Lee <baul.lee@xbow.com>
---
diff --git a/sound/usb/fcp.c b/sound/usb/fcp.c
index 6f5dcd35e1d4..2bf572c6fdc4 100644
--- a/sound/usb/fcp.c
+++ b/sound/usb/fcp.c
@@ -129,6 +129,10 @@ struct fcp_data {
 
 #define FCP_SEGMENT_APP_GOLD 0
 
+#define FCP_MAX_METER_MAP_SIZE \
+	(sizeof_field(struct snd_ctl_elem_value, value.integer.value) / \
+	 sizeof(long))
+
 /* Forward declarations */
 static int fcp_init(struct usb_mixer_interface *mixer,
 		    void *step0_resp, void *step2_resp);
@@ -410,6 +414,9 @@ static int fcp_meter_ctl_get(struct snd_kcontrol *kctl,
 	if (err < 0)
 		return err;
 
+	if (WARN_ON_ONCE(elem->channels > FCP_MAX_METER_MAP_SIZE))
+		return -EINVAL;
+
 	/* copy & translate from resp[] using meter_level_map[] */
 	for (i = 0; i < elem->channels; i++) {
 		int idx = private->meter_level_map[i];
@@ -636,7 +643,8 @@ static int fcp_ioctl_set_meter_map(struct usb_mixer_interface *mixer,
 	}
 
 	/* Validate the map size */
-	if (map.map_size < 1 || map.map_size > 255 ||
+	if (map.map_size < 1 ||
+	    map.map_size > FCP_MAX_METER_MAP_SIZE ||
 	    map.meter_slots < 1 || map.meter_slots > 255)
 		return -EINVAL;
 
-- 
2.50.1 (Apple Git-155)

