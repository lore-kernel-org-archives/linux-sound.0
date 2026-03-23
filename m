Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk [188.40.203.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215522EC0A2;
	Mon, 23 Mar 2026 18:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.203.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774291260; cv=none; b=VJ8HMkIajb2VQeFVkBsRcuMAZUMEHMkG27qkWwceJYSMx+FV9l5Xf0ZRJamYYjBcAWy4ZiyVinLLiVaWT8nYrVmoFkH/1WhrrumfaljVA0RXje4izMMVBHhWdb+LVZnosUmlP8sbM1umKTafQwBQEC7ut+/Ju/GR/xu0r042lc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774291260; c=relaxed/simple;
	bh=MBu/medIaMpIP3nuVttqMWJLxgmglWn2eTdkuG4cvFY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ocR57SpzJ9g/ahk7RssY/B7ot6zyq5v0W3eYBEURT4cXNDzTji1qvGVCiw4J9MkzuRHkNEzEFiZWi6b6Jtmijk/xXpSpYQMlgSYnFOuc5KuT6DzK+sYoSCIeJwGWP48HSLNIwI6L2ODHxeZyWskZPW/EAayLr3O83UfwzK9P4ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.com; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=mzrACFX0; arc=none smtp.client-ip=188.40.203.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="mzrACFX0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=vXpy0KTSPKzRma0G8gIkKZxtKP90Qbs2+As5y1JRSHM=; b=mzrACFX0sjOIee
	/preQZrPjJ1ES4wj5lKljydLsl9E9khIhwwU7RG4d8RXgbCBrMuZGLSdfsawXq/apdZDFBhF5zHPB
	9Olyu+ypXEOOlh3ZQwmTNGsUjSfncsLonge99Cb3wmvQTPkhyq756C34rNE+US/AJNFElIRgIkOge
	gP1exNThgMs+dWnzrhWuxKH/3VLWA+hWGjeUardfHtzyhWNXKT30VNVkJmKM/DgggAiqUPNZz+KPv
	cZ05x97AmOCi0GgQPY9ciICDQ/5mBmmMQ5NdN7VwaqYkFOUZUVz5aE8q13WkupGQsMUGTQI5ZWEId
	JMqYCPIodSXKvuuR+xlQ==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1w4jVZ-006C5b-Kv; Mon, 23 Mar 2026 17:56:09 +0000
Received: from ben by rainbowdash with local (Exim 4.99.1)
	(envelope-from <ben@rainbowdash>)
	id 1w4jVZ-0000000051k-0BsZ;
	Mon, 23 Mar 2026 17:56:09 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH v3] ASoC: soc-topology: fix __le32 conversion in printed values
Date: Mon, 23 Mar 2026 17:56:04 +0000
Message-Id: <20260323175604.19315-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: srv_ts003@codethink.com

A number of dev_dbg() and dev_err() calls get passed values that are
of __le32 type which does not get noticed by sparse until my variadic
checking patches.

There are a number of these, and we should probably fix these up.

The sparse warnings are numerous so the first few are listed here that
this patch fixes:

sound/soc/soc-topology.c:226:9: warning: incorrect type in argument 4 (different base types)
sound/soc/soc-topology.c:226:9:    expected int
sound/soc/soc-topology.c:226:9:    got restricted __le32 [usertype] get
sound/soc/soc-topology.c:226:9: warning: incorrect type in argument 5 (different base types)
sound/soc/soc-topology.c:226:9:    expected int
sound/soc/soc-topology.c:226:9:    got restricted __le32 [usertype] put
sound/soc/soc-topology.c:226:9: warning: incorrect type in argument 6 (different base types)
sound/soc/soc-topology.c:226:9:    expected int
sound/soc/soc-topology.c:226:9:    got restricted __le32 [usertype] info
sound/soc/soc-topology.c:226:9: warning: incorrect type in argument 4 (different base types)
sound/soc/soc-topology.c:226:9:    expected int
sound/soc/soc-topology.c:226:9:    got restricted __le32 [usertype] get
sound/soc/soc-topology.c:226:9: warning: incorrect type in argument 5 (different base types)
sound/soc/soc-topology.c:226:9:    expected int
sound/soc/soc-topology.c:226:9:    got restricted __le32 [usertype] put
sound/soc/soc-topology.c:226:9: warning: incorrect type in argument 6 (different base types)
sound/soc/soc-topology.c:226:9:    expected int
sound/soc/soc-topology.c:226:9:    got restricted __le32 [usertype] info
sound/soc/soc-topology.c:226:9: warning: incorrect type in argument 4 (different base types)
sound/soc/soc-topology.c:226:9:    expected int
sound/soc/soc-topology.c:226:9:    got restricted __le32 [usertype] get
sound/soc/soc-topology.c:226:9: warning: incorrect type in argument 5 (different base types)
sound/soc/soc-topology.c:226:9:    expected int
sound/soc/soc-topology.c:226:9:    got restricted __le32 [usertype] put
sound/soc/soc-topology.c:226:9: warning: incorrect type in argument 6 (different base types)
sound/soc/soc-topology.c:226:9:    expected int
sound/soc/soc-topology.c:226:9:    got restricted __le32 [usertype] info

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
V2:
  - updated to make format %u as __le32 is unsigned type
V3:
  - fixed missing %u in soc_tplg_valid_header()
---
 sound/soc/soc-topology.c | 73 ++++++++++++++++++++++------------------
 1 file changed, 40 insertions(+), 33 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 064b8d76b955..85679c8e0229 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -224,8 +224,11 @@ static inline void soc_control_err(struct soc_tplg *tplg,
 	struct snd_soc_tplg_ctl_hdr *hdr, const char *name)
 {
 	dev_err(tplg->dev,
-		"ASoC: no complete control IO handler for %s type (g,p,i) %d:%d:%d at 0x%lx\n",
-		name, hdr->ops.get, hdr->ops.put, hdr->ops.info,
+		"ASoC: no complete control IO handler for %s type (g,p,i) %u:%u:%u at 0x%lx\n",
+		name,
+		le32_to_cpu(hdr->ops.get),
+		le32_to_cpu(hdr->ops.put),
+		le32_to_cpu(hdr->ops.info),
 		soc_tplg_get_offset(tplg));
 }
 
@@ -238,17 +241,18 @@ static int soc_tplg_vendor_load(struct soc_tplg *tplg,
 	if (tplg->ops && tplg->ops->vendor_load)
 		ret = tplg->ops->vendor_load(tplg->comp, tplg->index, hdr);
 	else {
-		dev_err(tplg->dev, "ASoC: no vendor load callback for ID %d\n",
-			hdr->vendor_type);
+		dev_err(tplg->dev, "ASoC: no vendor load callback for ID %u\n",
+			le32_to_cpu(hdr->vendor_type));
 		return -EINVAL;
 	}
 
 	if (ret < 0)
 		dev_err(tplg->dev,
-			"ASoC: vendor load failed at hdr offset %ld/0x%lx for type %d:%d\n",
+			"ASoC: vendor load failed at hdr offset %ld/0x%lx for type %u:%u\n",
 			soc_tplg_get_hdr_offset(tplg),
 			soc_tplg_get_hdr_offset(tplg),
-			hdr->type, hdr->vendor_type);
+			le32_to_cpu(hdr->type),
+			le32_to_cpu(hdr->vendor_type));
 	return ret;
 }
 
@@ -625,8 +629,8 @@ static int soc_tplg_create_tlv(struct soc_tplg *tplg,
 
 		/* TODO: add support for other TLV types */
 		default:
-			dev_dbg(tplg->dev, "Unsupported TLV type %d\n",
-					tplg_tlv->type);
+			dev_dbg(tplg->dev, "Unsupported TLV type %u\n",
+				le32_to_cpu(tplg_tlv->type));
 			return -EINVAL;
 		}
 	}
@@ -653,7 +657,7 @@ static int soc_tplg_control_dmixer_create(struct soc_tplg *tplg, struct snd_kcon
 	tplg->pos += sizeof(struct snd_soc_tplg_mixer_control) + le32_to_cpu(mc->priv.size);
 
 	dev_dbg(tplg->dev, "ASoC: adding mixer kcontrol %s with access 0x%x\n",
-		mc->hdr.name, mc->hdr.access);
+		mc->hdr.name, le32_to_cpu(mc->hdr.access));
 
 	kc->name = devm_kstrdup(tplg->dev, mc->hdr.name, GFP_KERNEL);
 	if (!kc->name)
@@ -776,7 +780,7 @@ static int soc_tplg_control_denum_create(struct soc_tplg *tplg, struct snd_kcont
 
 	tplg->pos += (sizeof(struct snd_soc_tplg_enum_control) + le32_to_cpu(ec->priv.size));
 
-	dev_dbg(tplg->dev, "ASoC: adding enum kcontrol %s size %d\n", ec->hdr.name, ec->items);
+	dev_dbg(tplg->dev, "ASoC: adding enum kcontrol %s size %u\n", ec->hdr.name, le32_to_cpu(ec->items));
 
 	kc->name = devm_kstrdup(tplg->dev, ec->hdr.name, GFP_KERNEL);
 	if (!kc->name)
@@ -811,8 +815,8 @@ static int soc_tplg_control_denum_create(struct soc_tplg *tplg, struct snd_kcont
 		}
 		break;
 	default:
-		dev_err(tplg->dev, "ASoC: invalid enum control type %d for %s\n",
-			ec->hdr.ops.info, ec->hdr.name);
+		dev_err(tplg->dev, "ASoC: invalid enum control type %u for %s\n",
+			le32_to_cpu(ec->hdr.ops.info), ec->hdr.name);
 		return -EINVAL;
 	}
 
@@ -846,7 +850,7 @@ static int soc_tplg_control_dbytes_create(struct soc_tplg *tplg, struct snd_kcon
 	tplg->pos += (sizeof(struct snd_soc_tplg_bytes_control) + le32_to_cpu(be->priv.size));
 
 	dev_dbg(tplg->dev, "ASoC: adding bytes kcontrol %s with access 0x%x\n",
-		be->hdr.name, be->hdr.access);
+		be->hdr.name, le32_to_cpu(be->hdr.access));
 
 	kc->name = devm_kstrdup(tplg->dev, be->hdr.name, GFP_KERNEL);
 	if (!kc->name)
@@ -976,7 +980,7 @@ static int soc_tplg_kcontrol_elems_load(struct soc_tplg *tplg,
 	int ret;
 	int i;
 
-	dev_dbg(tplg->dev, "ASoC: adding %d kcontrols at 0x%lx\n", hdr->count,
+	dev_dbg(tplg->dev, "ASoC: adding %u kcontrols at 0x%lx\n", le32_to_cpu(hdr->count),
 		soc_tplg_get_offset(tplg));
 
 	for (i = 0; i < le32_to_cpu(hdr->count); i++) {
@@ -1003,8 +1007,8 @@ static int soc_tplg_kcontrol_elems_load(struct soc_tplg *tplg,
 		}
 
 		if (ret < 0) {
-			dev_err(tplg->dev, "ASoC: invalid control type: %d, index: %d at 0x%lx\n",
-				control_hdr->type, i, soc_tplg_get_offset(tplg));
+			dev_err(tplg->dev, "ASoC: invalid control type: %u, index: %d at 0x%lx\n",
+				le32_to_cpu(control_hdr->type), i, soc_tplg_get_offset(tplg));
 			return ret;
 		}
 	}
@@ -1040,8 +1044,8 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
 				      count, le32_to_cpu(hdr->payload_size), "graph"))
 		return -EINVAL;
 
-	dev_dbg(tplg->dev, "ASoC: adding %d DAPM routes for index %d\n", count,
-		hdr->index);
+	dev_dbg(tplg->dev, "ASoC: adding %d DAPM routes for index %u\n", count,
+		le32_to_cpu(hdr->index));
 
 	for (i = 0; i < count; i++) {
 		route = devm_kzalloc(tplg->dev, sizeof(*route), GFP_KERNEL);
@@ -1116,8 +1120,8 @@ static int soc_tplg_dapm_widget_create(struct soc_tplg *tplg,
 		SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
 		return -EINVAL;
 
-	dev_dbg(tplg->dev, "ASoC: creating DAPM widget %s id %d\n",
-		w->name, w->id);
+	dev_dbg(tplg->dev, "ASoC: creating DAPM widget %s id %u\n",
+		w->name, le32_to_cpu(w->id));
 
 	memset(&template, 0, sizeof(template));
 
@@ -1200,8 +1204,9 @@ static int soc_tplg_dapm_widget_create(struct soc_tplg *tplg,
 				goto hdr_err;
 			break;
 		default:
-			dev_err(tplg->dev, "ASoC: invalid widget control type %d:%d:%d\n",
-				control_hdr->ops.get, control_hdr->ops.put,
+			dev_err(tplg->dev, "ASoC: invalid widget control type %u:%u:%u\n",
+				le32_to_cpu(control_hdr->ops.get),
+				le32_to_cpu(control_hdr->ops.put),
 				le32_to_cpu(control_hdr->ops.info));
 			ret = -EINVAL;
 			goto hdr_err;
@@ -1745,8 +1750,8 @@ static int soc_tplg_link_config(struct soc_tplg *tplg,
 	link = snd_soc_find_dai_link(tplg->comp->card, le32_to_cpu(cfg->id),
 				     name, stream_name);
 	if (!link) {
-		dev_err(tplg->dev, "ASoC: physical link %s (id %d) not exist\n",
-			name, cfg->id);
+		dev_err(tplg->dev, "ASoC: physical link %s (id %u) not exist\n",
+			name, le32_to_cpu(cfg->id));
 		return -EINVAL;
 	}
 
@@ -1949,7 +1954,7 @@ static int soc_tplg_valid_header(struct soc_tplg *tplg,
 {
 	if (le32_to_cpu(hdr->size) != sizeof(*hdr)) {
 		dev_err(tplg->dev,
-			"ASoC: invalid header size for type %d at offset 0x%lx size 0x%zx.\n",
+			"ASoC: invalid header size for type %u at offset 0x%lx size 0x%zx.\n",
 			le32_to_cpu(hdr->type), soc_tplg_get_hdr_offset(tplg),
 			tplg->fw->size);
 		return -EINVAL;
@@ -1957,9 +1962,9 @@ static int soc_tplg_valid_header(struct soc_tplg *tplg,
 
 	if (soc_tplg_get_hdr_offset(tplg) + le32_to_cpu(hdr->payload_size) >= tplg->fw->size) {
 		dev_err(tplg->dev,
-			"ASoC: invalid header of type %d at offset %ld payload_size %d\n",
+			"ASoC: invalid header of type %u at offset %ld payload_size %u\n",
 			le32_to_cpu(hdr->type), soc_tplg_get_hdr_offset(tplg),
-			hdr->payload_size);
+			le32_to_cpu(hdr->payload_size));
 		return -EINVAL;
 	}
 
@@ -1967,7 +1972,7 @@ static int soc_tplg_valid_header(struct soc_tplg *tplg,
 	if (le32_to_cpu(hdr->magic) == SOC_TPLG_MAGIC_BIG_ENDIAN) {
 		dev_err(tplg->dev,
 			"ASoC: pass %d big endian not supported header got %x at offset 0x%lx size 0x%zx.\n",
-			tplg->pass, hdr->magic,
+			tplg->pass, le32_to_cpu(hdr->magic),
 			soc_tplg_get_hdr_offset(tplg), tplg->fw->size);
 		return -EINVAL;
 	}
@@ -1975,7 +1980,7 @@ static int soc_tplg_valid_header(struct soc_tplg *tplg,
 	if (le32_to_cpu(hdr->magic) != SND_SOC_TPLG_MAGIC) {
 		dev_err(tplg->dev,
 			"ASoC: pass %d does not have a valid header got %x at offset 0x%lx size 0x%zx.\n",
-			tplg->pass, hdr->magic,
+			tplg->pass, le32_to_cpu(hdr->magic),
 			soc_tplg_get_hdr_offset(tplg), tplg->fw->size);
 		return -EINVAL;
 	}
@@ -1985,7 +1990,7 @@ static int soc_tplg_valid_header(struct soc_tplg *tplg,
 	    le32_to_cpu(hdr->abi) < SND_SOC_TPLG_ABI_VERSION_MIN) {
 		dev_err(tplg->dev,
 			"ASoC: pass %d invalid ABI version got 0x%x need 0x%x at offset 0x%lx size 0x%zx.\n",
-			tplg->pass, hdr->abi,
+			tplg->pass, le32_to_cpu(hdr->abi),
 			SND_SOC_TPLG_ABI_VERSION, soc_tplg_get_hdr_offset(tplg),
 			tplg->fw->size);
 		return -EINVAL;
@@ -2054,9 +2059,11 @@ static int soc_tplg_load_header(struct soc_tplg *tplg,
 
 	if (tplg->pass == hdr_pass) {
 		dev_dbg(tplg->dev,
-			"ASoC: Got 0x%x bytes of type %d version %d vendor %d at pass %d\n",
-			hdr->payload_size, hdr->type, hdr->version,
-			hdr->vendor_type, tplg->pass);
+			"ASoC: Got 0x%x bytes of type %u version %u vendor %u at pass %d\n",
+			le32_to_cpu(hdr->payload_size),
+			le32_to_cpu(hdr->type),
+			le32_to_cpu(hdr->version),
+			le32_to_cpu(hdr->vendor_type), tplg->pass);
 		return elem_load(tplg, hdr);
 	}
 
-- 
2.37.2.352.g3c44437643

