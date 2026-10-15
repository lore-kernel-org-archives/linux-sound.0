Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587B234DCCD
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 22:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792103348; cv=pass; b=QG11vdnEveirp8GQ6H3mJWW/Z1C+hBPs4Lg4a5cTi/pHjHbq1Fn3KSOw6S3eJZ0uVEtXbacMU9Xov28UIOUOU/BeLa2++cv2bx5FzByD7o8jjaW2t5Ejm+4SyOV3ZF2CuV3LOTZBauSjLSXHUq8KK1G6ibAkaTOpW8cp+4O/LAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792103348; c=relaxed/simple;
	bh=NiKDaQULsN/FekldlPoSCg9eoNofARkit0zgu4y2lf8=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GLev2zsmjgb4+nZnz8kTGLU3hdu7mYV6t+iYSsCHP2Xjg74akPonpmkUPcUmOe71MYGjDAQgCrdv0IKt+uwycQjQPDYuSb63zxL+OgrPP83xkIkRVVPMBhkTizudQKC7hKyiDvglLz2F54rWhFIAPIcvu8Vd48xLd9jGpSPaUdw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZWxKcVyV; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZWxKcVyV"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67999045530so2202304d50.1
        for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 15:29:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792103346; cv=none;
        d=google.com; s=arc-20260327;
        b=Fcaevf1qpaB5Ocy3iS05hnwqjTgkkGMemMKnNK9V05V+4FQBqfPbawoDzYGMOTj785
         eI1IQOnt8CGR6CGqzq8G5Zynzjhf3EyrI5HIWmq6o6ik0gorJuHb+iopSNIFCISyzGv2
         d/A/Nb+25lkusrhVE9xSctldykQl4j+Nn/MD2LBC19xGE4xdm+Z1DAGoKKge5vxQzM+n
         PKZhnMfxTyJM+Q/JMA3Sx75o/5YR7DgzaF5Gk6AsVuxpX0xh0io0Dhzi/4BynCHp7/xa
         gUfGMBpoe5p8Vvof2XFN6795jGLT174W/YnnR9cfITye1gxkr7Cdfp8qF3ahrUIYVQHB
         rBdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=Bj1Epb5FfswhvVZ0TJyzF1qW5a3SYkt7ENfvhFrub7E=;
        fh=IUdblkxEiNSlxp18HXhsNzDd5y8Sr4vFrOZcwkIbrns=;
        b=h8+PYBspsMOfvLimDryK6VQy4TxCN4FR0KIN3aPGepIXFzsn3S6ao8r9phNJ6P/EBZ
         AZQ48AzehSRzqEwAeJJooYkbh2sJxqFQVt8wQq4dN3kyP7QQwGgnmXAPh4SINJFb/OVZ
         OsIGNqOMZshFF0dD3A5Uhvepqr6znXzOobLb1MCu5/+eXB/7KAXTT3d2SZ2y3UASTM4K
         IZmJZp25G80HRCrS19DoCNzdNuR0+cTCkhQPwEpwD6+3afPzsmvWLsistlGa/KnYQ1pB
         z6Hb/0XhRzG3ZyYZfmcxRcRzF17ZRjuN5pmCeYYBTJgaV9Vm9eyrcusxBTO+j2ElrFv4
         6ltg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792103346; x=1792708146; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bj1Epb5FfswhvVZ0TJyzF1qW5a3SYkt7ENfvhFrub7E=;
        b=ZWxKcVyVMOWCxxzD7j7MwMFyWKZ7XKmu+WL4trFsmsJPzyhDTyP5Blpe79MtLrp5gr
         +Bqpx5RwXqRgjfAquT2ApWQ8qqKq9VHM8Cv/O3dnLC+tlfQo7UbRohAc7SzR1r0f8fdL
         kUFUntNXXn4Rq3nnIiLQaCebjSek7owaVVKTJUA4PLOSFEw4nNzLXf6aV5y0IrkuC9TM
         nOsELBQCzuB2uysOFRD1cnbGjrXZ4NaY9vt6/AkMXgSnXHunzdC7QQt0691bIDZE3tnY
         LzitqwGnmjYUXsla2vzPykjzb0oYlhlEeAc1KO22nyBSWmJRe4xrv2dnoIysT/lWNVVI
         IPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792103346; x=1792708146;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bj1Epb5FfswhvVZ0TJyzF1qW5a3SYkt7ENfvhFrub7E=;
        b=sLlrfaOugr4MnT2PRE5/JbRtUmTDv+LI79LcAbh5D+2yEFq8Q8bYsobpeVAon1Rpxp
         K9fz4SP6z4ZYWKwf+8mT3K7i6mmZAdS0n6agnQ0/VtdjTahcU8xVqwYvx0Zm3muv5clv
         CHS8o37E2iZYuViC9aXiaNN7QDNZF4K8csEXMg4VnrNPSV6z7N6P5JF3lzpcGzFEF9x3
         4Zq3UQwom1BJALu13OSsCAcTS2Cdx+uaV18uPsyWGVJaqcGIX803Blc53zUQKvNElgj0
         cZMT5YZ9GH0Jwz1RFm8JMpN0FI1hBXKwkS+ySSVVm8fq3S07fAWhZMgGgp26R1AUG/R3
         7SGQ==
X-Gm-Message-State: AFq9FYITErg7XlOfgrq0FofNH9inXtbPqYwXN1BaDGCBS7UIqhtq5Mqx
	gBiW3Tkb9Z22+GUFh2NUybJ/onHVVYz1u6PpTzV9/5aNvYtdcoUPkBmzd5VnSdElzz/PndKcf0d
	nxmCHAzdOEe+P9UBII9lw+GDHAFZEDm3pE4/LjQM=
X-Gm-Gg: AYBFou2115NOlfF+Tazq1sCZk4kKygzdtkamQmBk2XopmWfu10PK2mSax9NWOndCwMr
	oqkt7iJ5GTbyRv/woVbXa9fevEMU8zjVOKcJjliuD9jfAaho/I9uX+PfhS53a+WKDRG75exbzWU
	umT7euUB86lSKYSSHjGrLeiZa/kZrVeoMpjQ/uPvJhYTcwcXozwvBL6CHQxWANKZu5nPYcmu+Eg
	/yfNMSjxMZQ19ow+dxtGitDq378YOEQcMxHvjajKQHqWK4JodcYqUtBbB8GhxSnJftZFh+LkGB1
	bsqqbkP0WVcj5aNnmItfudxg/73+BNINWwM8F4XDirAEKXFuHya8mCH4msHQXHpIW8kLmmaMkHI
	cgJSRDucFzWSv/5FDzPHU9ue2cfwiSeHpTOHkUkWw3ktwpg==
X-Received: by 2002:a05:690e:b85:b0:675:657b:8049 with SMTP id
 956f58d0204a3-67936a5bc0cmr7401301d50.77.1792103346176; Thu, 15 Oct 2026
 15:29:06 -0700 (PDT)
Received: from 595171893313 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Oct 2026 18:29:05 -0400
Received: from 595171893313 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Oct 2026 18:29:05 -0400
From: Gemayel Lira <gemayellira@gmail.com>
In-Reply-To: <000301dd2e36$f0cc5ea0$d2651be0$@opensource.cirrus.com>
References: <CAD96ZT+SnRnGr4Xd+NJkkVNpj8XrzL3Ete=pRgz05mqxAzbU2w@mail.gmail.com>
 <CAD96ZTJzEwiNwJm4ujLS4+X_KChi4+_sD0j-m+aE+_9i+eUGcA@mail.gmail.com> <000301dd2e36$f0cc5ea0$d2651be0$@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 15 Oct 2026 18:29:05 -0400
X-Gm-Features: AclHuK98rkwv-JrkBYl5rNF6_HbarRJHAp0tGUDDcKLhldq08QqmjhpqYPvCG0k
Message-ID: <CAD96ZTJFD5pWcZqk1FRRsFS6tmMMiOGduxK+4SGb45jeZvp1OQ@mail.gmail.com>
Subject: [PATCH v3] ALSA: hda: cs35l41: Enable VSPK on UX3405CA when ACPI
 leaves GPIO1 unused
To: linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, 
	Jaroslav Kysela <perex@perex.cz>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Stefan Binding <sbinding@opensource.cirrus.com>, patches@opensource.cirrus.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The ASUS Zenbook 14 UX3405CA (SSID 1043:1A63) already has a valid _DSD
and uses missing_speaker_id_gpio2. ACPI sets cirrus,gpio1-func to VSPK
on the left amplifier and unused on the right, so the right channel
binds with VSPK: 0 and volume drops shortly after playback starts.

After parsing ACPI, enable VSPK on GPIO1 when it was left unused.

Signed-off-by: Gemayel Lira <gemayellira@gmail.com>
---
Changes in v3:
- Rebased onto tiwai/sound for-next. missing_speaker_id_gpio2 is still
  used only by SSID 10431A63, so the GPIO1 change does not touch other
  laptops.
- No functional change from v2. Still no generic_dsd_config and no
  internal-boost override.
- Test kernel is now Ubuntu 7.0.0-38-generic. The running proof is the
  out-of-tree module of this hunk (srcversion 955693DEB4FC9A01D9EF0EC):
  both amps VSPK: 1, SPKID: 1, firmware
  spk-prot-10431a63-spkid1-{l,r}0.bin. No PM -110 or SPI -16 with that
  module. One earlier S3 on 7.0.0-27 reloaded both amps with no resume
  error. Not a multi-cycle S3 claim.

v2 discussion:
Stefan Binding replied that enabling GPIO1 on the second amp should not
have an effect and asked for a bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=221896
On 2026-09-25 (comment #15) he wrote that this unit has no
CirrusSmartAmpCalibrationData EFI variable and that missing calibration
is not something the driver can supply; contact the laptop vendor.
This patch does not invent calibration data. It only sets GPIO1 to
VSPK_SWITCH when ACPI left the function unused, which is what stops the
right channel binding with VSPK: 0.

v1: Message-ID:
<CAD96ZT+SnRnGr4Xd+NJkkVNpj8XrzL3Ete=pRgz05mqxAzbU2w@mail.gmail.com>
v2: Message-ID:
<CAD96ZTJzEwiNwJm4ujLS4+X_KChi4+_sD0j-m+aE+_9i+eUGcA@mail.gmail.com>

 .../hda/codecs/side-codecs/cs35l41_hda_property.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
index 272421d1b..002771848 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
@@ -479,7 +479,20 @@ static int missing_speaker_id_gpio2(struct
cs35l41_hda *cs35l41, struct device *
 		return ret;
 	}

-	return cs35l41_hda_parse_acpi(cs35l41, physdev, id);
+	ret = cs35l41_hda_parse_acpi(cs35l41, physdev, id);
+	if (ret)
+		return ret;
+
+	/*
+	 * ACPI on 10431A63 sets gpio1 to VSPK on the left amp and unused
+	 * on the right, so the right channel binds with VSPK: 0.
+	 */
+	if (cs35l41->hw_cfg.gpio1.func == CS35L41_NOT_USED) {
+		cs35l41->hw_cfg.gpio1.func = CS35l41_VSPK_SWITCH;
+		cs35l41->hw_cfg.gpio1.valid = true;
+	}
+
+	return 0;
 }

 struct cs35l41_prop_model {

base-commit: 7f21312381fee99f58b383fa07374da3c614aec4
-- 
2.53.0
