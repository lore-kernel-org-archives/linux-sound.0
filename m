Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB571922F5
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 19:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773774991; cv=none; b=PPw6SKvROSuAlzSSFA77JdSyxWkEwiqPqS5mr93WD0MeTf/DXJ4lHwOnIgTYM4GHtOG7Ub7IEjtZ6gQcXUY3dnArke/JSIlZEXWmef3g2oqfuXxtLnN6dtby2CDHiEcKFJB7IjgUZ5vQxrKBOErCwWECI7p8y3KgVbEL+F7M60w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773774991; c=relaxed/simple;
	bh=AusvSwUyo/ia4o9pnKiDXYbXSTW8aHRzRq2lgMTLrHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ui1nXpnQ8z8L3Aqr+YDoPV+24VXuuh9u2je4KPOfPih5RFt3ibq/JrHbJNEAiaGt32tHtJRu8nSzdPCSphPpgjkFjAY+fPJGnI2jYKrkJwN1Hd9OVG/mu1nGJFxO8RN3WCtT8rcnMUvvCxcP+9ZsSdSlBj6cFne44pQuadKUIy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C9SBvEDU; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C9SBvEDU"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c7413a0e5a0so458304a12.1
        for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 12:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773774988; x=1774379788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNksHD/Ia/lI3PwtOgNwKe8s7JojbqFZYiYVCtaCE+Q=;
        b=C9SBvEDUs8rTeSlEIG7B2b6A4TbCXxLDC83A/ewC0A8dH9gpUomZCd/CGgR2mhoaO1
         VmNt0NT/AfBPiiVCAhjYSDjv2lMVKQJ7PbHJV+YaaO3jVA841zSrG56TbYz34gcsFXje
         wi4ns6vQNxjFEr0STLBmEW/+KhdQxhkQ7vwHxuxZkIv/4RhGnEhtjPbYHTiwvCyHI1hn
         XSObpxBb8wnAeaQcyey/1xb54k3JhiMRRcab2Lo2NgdVgsBrlycxj7NsnBdGpor5UH5V
         ril7xrcCLTTbQG6DzxFpyXNFxesuBBzDGHydtq+LDTQ7rdOdWkqsMqaXwz/kpFP3o+X8
         ma8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773774988; x=1774379788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xNksHD/Ia/lI3PwtOgNwKe8s7JojbqFZYiYVCtaCE+Q=;
        b=ddtuFGOq1ULwKDBl0kiCXMZuiPJ6PZtM5ppmF6dJBsA+NrTHkiD08zMx5anewACtXT
         UggMrAiyNgh2DWUi/J/XeOlVOn3JzEBv33eCNKZ15j2o90yQtZPEWjtZW5W43l+3YX3X
         qP2JYZ6Lw9uVt2+W88OvueqQQ573s3yWJS2+vMRmr3cTEz9+s/8KjMpquJBxt4jMSciw
         SSsmLUvxi5TczFNAgBpDeCpB1YqW9q4omGa5ZQYXnRfUMz+j/xrUK+my98rVpjrx68UW
         8vG5QdFf1+ZQuTKoLd/ujPdShe+FAK3AuH4S6XvvrU+JkEMdb1+UBmbD2YK9kANBMAGG
         blzw==
X-Forwarded-Encrypted: i=1; AJvYcCXoDeg+0Rt2ybeRnwaY4Zds5pt/PKmu0AwzsmdHtGUkUyBpSug8wfjCL5aIkJVaMebs3K2z/+QXE7p9XQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuoHwV6rFjMgyVZbZRQDLaLK+IIjcNCpRxrhq6eLmYcziZmBeY
	MNZIpcU/Ng1MMF2+5Dw+SXNKIendSawRhw9Hl2GERma3v2wvfDS8Oemb
X-Gm-Gg: ATEYQzwhSa01U25/scDJOB8DYyNE2zflLAmlSG8Gb1h1RK1fl2jEgPoa4OEgo5XpVcv
	b3xODH8rDV6aOXS20AY+VZpxGf8bftQd9aV8byKiunKrCbZiB1yHtz8VbjYiCNlGQtp4YmIuACu
	38vKeFIEcMD7W3HePTlKmCUTSyuqkAioUpK8nc/YcCa7WH+k6lWIEwFW5L4h7aEjs1ROwTXgTOY
	x4EcJCmIIufr4khQWHU3BdBirdGZE77PPCPX4lej36QXBpKYTlGHOtN81TDBYIa5DUtLnUUq01C
	uaVx805bR5JxmB05hfRTTFboo22CHf8l74+CHH6wHMVmIShzgYQFYGGWIR8RhrXOZa6MOLTRA52
	hV+GDYfWgY98t+9HX6NiFWhVFph09cIM0WYnPgb+wlsfum3+5zOeFzXt7CNpxkaPaQnCc1djxCp
	73cBhmDHnTGjUwO07U2+7xNw7W2QYN9ex1ATNgvPYzO9Ya1pnrFkzJ5uxJb9JutR6oxhvKqSDAt
	F6oZirjt3Ir5gvFwEQfporIQVm5LOOYAQlEPisH8gzna3os6KqYSFepJV15y0YR3Ae9dfQ9npDc
	ZdbR
X-Received: by 2002:a05:6a21:398d:b0:39b:7f5f:d591 with SMTP id adf61e73a8af0-39b9a0c86ddmr341476637.63.1773774988182;
        Tue, 17 Mar 2026 12:16:28 -0700 (PDT)
Received: from 2045D.localdomain (76.sub-72-110-123.myvzw.com. [72.110.123.76])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e546b01sm334350a12.21.2026.03.17.12.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 12:16:27 -0700 (PDT)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: gregkh@linuxfoundation.org,
	dakr@kernel.org,
	rafael@kernel.org,
	jani.nikula@linux.intel.com,
	rodrigo.vivi@intel.com,
	joonas.lahtinen@linux.intel.com,
	tursulin@ursulin.net,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: gustavo.sousa@intel.com,
	demarchi@kernel.org,
	jouni.hogander@intel.com,
	luciano.coelho@intel.com,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-sound@vger.kernel.org,
	akaieurus@gmail.com,
	me@ziyao.cc,
	Gui-Dong Han <hanguidong02@gmail.com>
Subject: [PATCH 4/4] drm/i915/display: initialize string params to empty strings
Date: Wed, 18 Mar 2026 03:15:38 +0800
Message-ID: <20260317191538.43535-1-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317185920.43387-1-hanguidong02@gmail.com>
References: <20260317185920.43387-1-hanguidong02@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Passing NULL to debugfs_create_str() causes a NULL pointer dereference
upon reading, and is no longer permitted. Change the default values of
dmc_firmware_path and vbt_firmware to empty strings ("").

Existing code that consumes these parameters already verifies both
pointer validity and string length, so empty strings are handled
correctly. Furthermore, heap allocation is not required here: these
debugfs parameters are created with strictly read-only permissions
(0400). As a result, the debugfs write operation is never invoked,
meaning the static empty string will not be erroneously freed by
kfree().

Fixes: e9913f0bd2e1 ("drm/i915/display: move dmc_firmware_path to display params")
Fixes: 29292bc6cc37 ("drm/i915/display: Move vbt_firmware module parameter under display")
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_display_params.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/drivers/gpu/drm/i915/display/intel_display_params.h
index b95ecf728daa..0a8cad98d480 100644
--- a/drivers/gpu/drm/i915/display/intel_display_params.h
+++ b/drivers/gpu/drm/i915/display/intel_display_params.h
@@ -23,8 +23,8 @@ struct drm_printer;
  *       debugfs file
  */
 #define INTEL_DISPLAY_PARAMS_FOR_EACH(param) \
-	param(char *, dmc_firmware_path, NULL, 0400) \
-	param(char *, vbt_firmware, NULL, 0400) \
+	param(char *, dmc_firmware_path, "", 0400) \
+	param(char *, vbt_firmware, "", 0400) \
 	param(int, lvds_channel_mode, 0, 0400) \
 	param(int, panel_use_ssc, -1, 0600) \
 	param(int, vbt_sdvo_panel_type, -1, 0400) \
-- 
2.43.0

