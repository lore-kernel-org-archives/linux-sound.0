From: Keith Owens <kaos@ocs.com.au>
Date: Sun, 01 Jul 2001 14:16:49 +0000
Subject: FYI, drivers/sound/Makefile for 2.5
Message-Id: <marc-linux-sound-99399703805420@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Please cc: kaos@ocs.com.au, I am not on this list.

FYI, this is what the drivers/sound/Makefile will look like in 2.5.
Makefiles are rewritten to use a mini language which says what we want
to do, not how to do it.  The makefile pre-processor converts the mini
language into make commands.  Quick language definition:

expsyms() - these objects export symbols.
objlink() - the first object is the target, built up from the rest.
select() - if config is set (y or m), build the rest of the list.
ifsel() - true if config is y or m.
linksubdirs() - include objects from subdirs when building vmlinux.
assembler() - compile as assembler.
$(objfile) - replace by name of file in object directory.
$(srcfile) - replace by name of file in source directory.  Source and
        object can be separate directories.

user_command(target (dependencies) (command) (flags)) - the main reason
for this mail.  user_command() :-

  Creates a rule for target, based on dependencies, running the command.
  Saves the command and the flags in a target specific work file.
  On the next kernel build, checks if the command or flags have changed
  and does a force rebuild if they have.
  Adds the target to the make clean list.

The flags are not used in the command, they are just text that is saved
and compared on the next kernel build.  Typically they are config
options which must cause a rebuild if they change.  Since options can
be empty, I used ':' between them to remove any ambiguity.

The list below is considerably simpler than the existing sound
Makefile, especially where user_command() has replaced all the hand
crafted make commands.  This is from 2.4.4, my work in progress kernel.
It will be upgraded to 2.4.current once I have all the bugs out of the
pre-processor programs.

Have I missed anything, or got any of the user_commands wrong?

#
# Makefile for the Linux sound card driver

expsyms(ad1848.o audio_syms.o midi_syms.o mpu401.o msnd.o opl3.o sb_common.o
	sequencer_syms.o sound_core.o sound_syms.o uart401.o nm256_audio.o
	ac97.o ac97_codec.o aci.o)

objlink(sound.o dev_table.o soundcard.o sound_syms.o audio.o
        audio_syms.o dmabuf.o midi_syms.o midi_synth.o midibuf.o
        sequencer.o sequencer_syms.o sound_timer.o sys_timer.o)
objlink(gus.o gus_card.o gus_midi.o gus_vol.o gus_wave.o ics2101.o)
objlink(pas2.o pas2_card.o pas2_midi.o pas2_mixer.o pas2_pcm.o)
objlink(sb.o sb_card.o)
objlink(sb_lib.o sb_common.o sb_audio.o sb_midi.o sb_mixer.o sb_ess.o)
objlink(vidc_mod.o vidc.o vidc_fill.o)
objlink(soundcore.o sound_core.o sound_firmware.o)
objlink(wavefront.o wavfront.o wf_midi.o yss225.o)

select(CONFIG_SOUND soundcore.o)
select(CONFIG_SOUND_OSS sound.o)
select(CONFIG_SOUND_CS4232 cs4232.o ad1848.o)

# Please leave it as is, cause the link order is significant !

select(CONFIG_SOUND_AEDSP16 aedsp16.o)
select(CONFIG_SOUND_PSS pss.o ad1848.o mpu401.o)
select(CONFIG_SOUND_TRIX trix.o ad1848.o sb_lib.o uart401.o)
select(CONFIG_SOUND_OPL3SA1 opl3sa.o ad1848.o uart401.o)
select(CONFIG_SOUND_SSCAPE sscape.o ad1848.o mpu401.o)
select(CONFIG_SOUND_MAD16 mad16.o ad1848.o sb_lib.o uart401.o)
select(CONFIG_SOUND_CS4232 cs4232.o uart401.o)
select(CONFIG_SOUND_OPL3SA2 opl3sa2.o ad1848.o mpu401.o)
select(CONFIG_SOUND_MSS ad1848.o)
select(CONFIG_SOUND_PAS pas2.o sb.o sb_lib.o uart401.o)
select(CONFIG_SOUND_SB sb.o sb_lib.o uart401.o)
select(CONFIG_SOUND_WAVEFRONT wavefront.o)
select(CONFIG_SOUND_MAUI maui.o mpu401.o)
select(CONFIG_SOUND_MPU401 mpu401.o)
select(CONFIG_SOUND_UART6850 uart6850.o)
select(CONFIG_SOUND_GUS gus.o ad1848.o)
select(CONFIG_SOUND_ADLIB adlib_card.o opl3.o)
select(CONFIG_SOUND_YM3812 opl3.o)
select(CONFIG_SOUND_VMIDI v_midi.o)
select(CONFIG_SOUND_VIDC vidc_mod.o)
select(CONFIG_SOUND_WAVEARTIST waveartist.o)
select(CONFIG_SOUND_SGALAXY sgalaxy.o ad1848.o)
select(CONFIG_SOUND_AD1816 ad1816.o)
select(CONFIG_SOUND_ACI_MIXER aci.o)
select(CONFIG_SOUND_AWE32_SYNTH awe_wave.o)

select(CONFIG_SOUND_VIA82CXXX via82cxxx_audio.o ac97_codec.o)
select(CONFIG_SOUND_YMFPCI ymfpci.o ac97_codec.o)
ifsel(CONFIG_SOUND_YMFPCI_LEGACY)
  select(CONFIG_SOUND_YMFPCI opl3.o uart401.o)
endif
select(CONFIG_SOUND_MSNDCLAS msnd.o msnd_classic.o)
select(CONFIG_SOUND_MSNDPIN msnd.o msnd_pinnacle.o)
select(CONFIG_SOUND_VWSND vwsnd.o)
select(CONFIG_SOUND_NM256 nm256_audio.o ac97.o)
select(CONFIG_SOUND_ICH i810_audio.o ac97_codec.o)
select(CONFIG_SOUND_SONICVIBES sonicvibes.o)
select(CONFIG_SOUND_CMPCI cmpci.o)
select(CONFIG_SOUND_ES1370 es1370.o)
select(CONFIG_SOUND_ES1371 es1371.o ac97_codec.o)
select(CONFIG_SOUND_ESSSOLO1 esssolo1.o)
select(CONFIG_SOUND_FUSION cs46xx.o ac97_codec.o)
select(CONFIG_SOUND_MAESTRO maestro.o)
select(CONFIG_SOUND_MAESTRO3 maestro3.o ac97_codec.o)
select(CONFIG_SOUND_TRIDENT trident.o ac97_codec.o)

link_subdirs(emu10k1)
link_subdirs(cs4281)
link_subdirs(dmasound)

assembler(vidc_fill.o)

# Firmware files that need translation
#
# The translated files are protected by a file that keeps track
# of what name was used to build them.  If the name changes, they
# will be forced to be remade.
#
# First make the utilities.

$(objfile bin2hex): $(srcfile bin2hex.c)
	$(HOSTCC) $(HOSTCFLAGS) -o $@ $<

$(objfile hex2hex): $(srcfile hex2hex.c)
	$(HOSTCC) $(HOSTCFLAGS) -o $@ $<

MRPROPER	+= $(objfile bin2hex) $(objfile hex2hex) $(objfile *.boot)


# Turtle Beach Maui / Tropez

$(objfile maui.o): $(objfile maui_boot.h)

ifsel(CONFIG_MAUI_HAVE_BOOT)
user_command(maui_boot.h
	($(patsubst "%", %, $(CONFIG_MAUI_BOOT_FILE)) $(objfile bin2hex))
	($(objfile bin2hex) -i maui_os < $(CONFIG_MAUI_BOOT_FILE) > $@)
	($(CONFIG_MAUI_HAVE_BOOT):$(CONFIG_MAUI_BOOT_FILE))
	)
else
user_command(maui_boot.h
	()
	(echo "static unsigned char * maui_os = NULL; static int maui_osLen = 0;" > $@)
	($(CONFIG_MAUI_HAVE_BOOT):$(CONFIG_MAUI_BOOT_FILE))
	)
endif


# Turtle Beach MultiSound

ifsel(CONFIG_MSNDCLAS_HAVE_BOOT)
$(objfile msnd_classic.o): $(objfile msndperm.c) $(objfile msndinit.c)
endif

user_command(msndperm.c
	($(patsubst "%", %, $(CONFIG_MSNDCLAS_PERM_FILE)) $(objfile bin2hex))
	($(objfile bin2hex) msndperm < $(CONFIG_MSNDCLAS_PERM_FILE) > $@)
	($(CONFIG_MSNDCLAS_HAVE_BOOT):$(CONFIG_MSNDCLAS_PERM_FILE))
	)

user_command(msndinit.c
	($(patsubst "%", %, $(CONFIG_MSNDCLAS_INIT_FILE)) $(objfile bin2hex))
	($(objfile bin2hex) msndinit < $(CONFIG_MSNDCLAS_INIT_FILE) > $@)
	($(CONFIG_MSNDCLAS_HAVE_BOOT):$(CONFIG_MSNDCLAS_INIT_FILE))
	)

ifsel(CONFIG_MSNDPIN_HAVE_BOOT)
$(objfile msnd_pinnacle.o): $(objfile pndsperm.c) $(objfile pndspini.c)
endif

user_command(pndsperm.c
	($(patsubst "%", %, $(CONFIG_MSNDPIN_PERM_FILE)) $(objfile bin2hex))
	($(objfile bin2hex) pndsperm < $(CONFIG_MSNDPIN_PERM_FILE) > $@)
	($(CONFIG_MSNDPIN_HAVE_BOOT):$(CONFIG_MSNDPIN_PERM_FILE))
	)

user_command(pndspini.c
	($(patsubst "%", %, $(CONFIG_MSNDPIN_INIT_FILE)) $(objfile bin2hex))
	($(objfile bin2hex) pndspini < $(CONFIG_MSNDPIN_INIT_FILE) > $@)
	($(CONFIG_MSNDPIN_HAVE_BOOT):$(CONFIG_MSNDPIN_INIT_FILE))
	)

# PSS (ECHO-ADI2111)

$(objfile pss.o): $(objfile pss_boot.h)

ifsel(CONFIG_PSS_HAVE_BOOT)
user_command(pss_boot.h
	($(patsubst "%", %, $(CONFIG_PSS_BOOT_FILE)) $(objfile bin2hex))
	($(objfile bin2hex) pss_synth < $(CONFIG_PSS_BOOT_FILE) > $@)
	($(CONFIG_PSS_HAVE_BOOT):$(CONFIG_PSS_BOOT_FILE))
	)
else
user_command(pss_boot.h
	()
	(echo "static unsigned char * pss_synth = NULL; static int pss_synthLen = 0;" > $@)
	($(CONFIG_PSS_HAVE_BOOT):$(CONFIG_PSS_BOOT_FILE))
	)
endif

# MediaTrix AudioTrix Pro

$(objfile trix.o): $(objfile trix_boot.h)

ifsel(CONFIG_TRIX_HAVE_BOOT)
user_command(trix_boot.h
	($(patsubst "%", %, $(CONFIG_TRIX_BOOT_FILE)) $(objfile hex2hex))
	($(objfile hex2hex) -i trix_boot < $(CONFIG_TRIX_BOOT_FILE) > $@)
	($(CONFIG_TRIX_HAVE_BOOT):$(CONFIG_TRIX_BOOT_FILE))
	)
else
user_command(trix_boot.h
	()
	(echo "static unsigned char * trix_boot = NULL; static int trix_boot_len = 0;" > $@)
	($(CONFIG_TRIX_HAVE_BOOT):$(CONFIG_TRIX_BOOT_FILE))
	)
endif

-
To unsubscribe from this list: send the line "unsubscribe linux-sound" in
the body of a message to majordomo@vger.kernel.org
